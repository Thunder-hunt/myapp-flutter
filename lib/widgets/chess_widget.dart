import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum ChessMode { playerVsPlayer, playerVsBot, botVsBot }

enum Side { white, black }

enum PieceType { pawn, rook, knight, bishop, queen, king }

class _Piece {
  _Piece(this.type, this.side, {this.moved = false});
  final PieceType type;
  final Side side;
  bool moved;
  _Piece copy() => _Piece(type, side, moved: moved);

  String get symbol {
    const white = {
      PieceType.king: '♔',
      PieceType.queen: '♕',
      PieceType.rook: '♖',
      PieceType.bishop: '♗',
      PieceType.knight: '♘',
      PieceType.pawn: '♙',
    };
    const black = {
      PieceType.king: '♚',
      PieceType.queen: '♛',
      PieceType.rook: '♜',
      PieceType.bishop: '♝',
      PieceType.knight: '♞',
      PieceType.pawn: '♟',
    };
    return (side == Side.white ? white : black)[type]!;
  }
}

class _Move {
  const _Move(
    this.from,
    this.to, {
    this.castle = false,
    this.enPassant = false,
  });
  final Point<int> from;
  final Point<int> to;
  final bool castle;
  final bool enPassant;
}

class ChessWidget extends StatefulWidget {
  const ChessWidget({super.key});
  @override
  State<ChessWidget> createState() => _ChessWidgetState();
}

class _ChessWidgetState extends State<ChessWidget> {
  List<List<_Piece?>> _board = _initialBoard();
  ChessMode? _mode;
  Side _turn = Side.white;
  Point<int>? _selected;
  List<_Move> _moves = [];
  Point<int>? _enPassant;
  Timer? _botTimer;
  String _status = 'Pilih mode permainan untuk mulai.';
  bool _finished = false;
  int _moveNumber = 1;

  static List<List<_Piece?>> _initialBoard() {
    final board = List.generate(8, (_) => List<_Piece?>.filled(8, null));
    const back = [
      PieceType.rook,
      PieceType.knight,
      PieceType.bishop,
      PieceType.queen,
      PieceType.king,
      PieceType.bishop,
      PieceType.knight,
      PieceType.rook,
    ];
    for (var c = 0; c < 8; c++) {
      board[0][c] = _Piece(back[c], Side.black);
      board[1][c] = _Piece(PieceType.pawn, Side.black);
      board[6][c] = _Piece(PieceType.pawn, Side.white);
      board[7][c] = _Piece(back[c], Side.white);
    }
    return board;
  }

  List<List<_Piece?>> _copyBoard(List<List<_Piece?>> source) =>
      List.generate(8, (r) => List.generate(8, (c) => source[r][c]?.copy()));
  bool _inside(int r, int c) => r >= 0 && r < 8 && c >= 0 && c < 8;
  Side _other(Side side) => side == Side.white ? Side.black : Side.white;
  bool get _humanTurn =>
      _mode == ChessMode.playerVsPlayer ||
      (_mode == ChessMode.playerVsBot && _turn == Side.white);

  void _start(ChessMode mode) {
    _botTimer?.cancel();
    setState(() {
      _mode = mode;
      _board = _initialBoard();
      _turn = Side.white;
      _selected = null;
      _moves = [];
      _enPassant = null;
      _status = 'Giliran Putih';
      _finished = false;
      _moveNumber = 1;
    });
    _runBotIfNeeded();
  }

  void _tapSquare(int r, int c) {
    if (_mode == null || _finished || !_humanTurn) return;
    final point = Point(r, c);
    final chosen = _moves.where((move) => move.to == point).firstOrNull;
    if (chosen != null) {
      _play(chosen);
    } else if (_board[r][c]?.side == _turn) {
      setState(() {
        _selected = point;
        _moves = _legalMoves(point, _board);
      });
    } else {
      setState(() {
        _selected = null;
        _moves = [];
      });
    }
  }

  List<_Move> _legalMoves(Point<int> from, List<List<_Piece?>> board) {
    final piece = board[from.x][from.y];
    if (piece == null) return [];
    return _pseudoMoves(from, board).where((move) {
      final copy = _copyBoard(board);
      _applyMove(copy, move);
      return !_inCheck(piece.side, copy);
    }).toList();
  }

  List<_Move> _allLegal(Side side, List<List<_Piece?>> board) {
    final result = <_Move>[];
    for (var r = 0; r < 8; r++) {
      for (var c = 0; c < 8; c++) {
        if (board[r][c]?.side == side)
          result.addAll(_legalMoves(Point(r, c), board));
      }
    }
    return result;
  }

  List<_Move> _pseudoMoves(Point<int> from, List<List<_Piece?>> board) {
    final piece = board[from.x][from.y];
    if (piece == null) return [];
    final result = <_Move>[];
    void add(int r, int c, {bool castle = false, bool enPassant = false}) {
      if (!_inside(r, c)) return;
      final target = board[r][c];
      if (target?.side == piece.side || target?.type == PieceType.king) return;
      result.add(
        _Move(from, Point(r, c), castle: castle, enPassant: enPassant),
      );
    }

    if (piece.type == PieceType.pawn) {
      final direction = piece.side == Side.white ? -1 : 1;
      final start = piece.side == Side.white ? 6 : 1;
      final next = from.x + direction;
      if (_inside(next, from.y) && board[next][from.y] == null) {
        add(next, from.y);
        if (from.x == start && board[from.x + 2 * direction][from.y] == null)
          add(from.x + 2 * direction, from.y);
      }
      for (final dc in [-1, 1]) {
        final col = from.y + dc;
        if (!_inside(next, col)) continue;
        final target = board[next][col];
        if (target != null &&
            target.side != piece.side &&
            target.type != PieceType.king)
          add(next, col);
        if (_enPassant == Point(next, col)) add(next, col, enPassant: true);
      }
    } else if (piece.type == PieceType.knight) {
      const jumps = [
        Point(2, 1),
        Point(2, -1),
        Point(-2, 1),
        Point(-2, -1),
        Point(1, 2),
        Point(1, -2),
        Point(-1, 2),
        Point(-1, -2),
      ];
      for (final jump in jumps) add(from.x + jump.x, from.y + jump.y);
    } else if (piece.type == PieceType.king) {
      for (var r = from.x - 1; r <= from.x + 1; r++) {
        for (var c = from.y - 1; c <= from.y + 1; c++) {
          if (r != from.x || c != from.y) add(r, c);
        }
      }
      if (!piece.moved && !_inCheck(piece.side, board)) {
        if (_canCastle(from.x, 7, piece.side, board, true))
          result.add(_Move(from, Point(from.x, 6), castle: true));
        if (_canCastle(from.x, 0, piece.side, board, false))
          result.add(_Move(from, Point(from.x, 2), castle: true));
      }
    } else {
      final directions = <Point<int>>[];
      if (piece.type == PieceType.rook || piece.type == PieceType.queen)
        directions.addAll(const [
          Point(1, 0),
          Point(-1, 0),
          Point(0, 1),
          Point(0, -1),
        ]);
      if (piece.type == PieceType.bishop || piece.type == PieceType.queen)
        directions.addAll(const [
          Point(1, 1),
          Point(1, -1),
          Point(-1, 1),
          Point(-1, -1),
        ]);
      for (final direction in directions) {
        var r = from.x + direction.x;
        var c = from.y + direction.y;
        while (_inside(r, c)) {
          if (board[r][c] == null) {
            add(r, c);
          } else {
            if (board[r][c]!.side != piece.side &&
                board[r][c]!.type != PieceType.king)
              add(r, c);
            break;
          }
          r += direction.x;
          c += direction.y;
        }
      }
    }
    return result;
  }

  bool _canCastle(
    int row,
    int rookCol,
    Side side,
    List<List<_Piece?>> board,
    bool kingSide,
  ) {
    final rook = board[row][rookCol];
    if (rook?.type != PieceType.rook || rook?.side != side || rook!.moved)
      return false;
    final between = kingSide ? [5, 6] : [1, 2, 3];
    if (between.any((c) => board[row][c] != null)) return false;
    final path = kingSide ? [5, 6] : [3, 2];
    for (final c in path) {
      final test = _copyBoard(board);
      test[row][4] = null;
      test[row][c] = _Piece(PieceType.king, side);
      if (_inCheck(side, test)) return false;
    }
    return true;
  }

  bool _attacks(Point<int> from, Point<int> target, List<List<_Piece?>> board) {
    final piece = board[from.x][from.y];
    if (piece == null) return false;
    final dr = target.x - from.x;
    final dc = target.y - from.y;
    if (piece.type == PieceType.pawn)
      return dr == (piece.side == Side.white ? -1 : 1) && dc.abs() == 1;
    if (piece.type == PieceType.knight)
      return (dr.abs() == 2 && dc.abs() == 1) ||
          (dr.abs() == 1 && dc.abs() == 2);
    if (piece.type == PieceType.king) return dr.abs() <= 1 && dc.abs() <= 1;
    final diagonal = dr.abs() == dc.abs();
    final straight = dr == 0 || dc == 0;
    final valid = piece.type == PieceType.bishop
        ? diagonal
        : piece.type == PieceType.rook
        ? straight
        : diagonal || straight;
    if (!valid) return false;
    final stepR = dr == 0 ? 0 : dr ~/ dr.abs();
    final stepC = dc == 0 ? 0 : dc ~/ dc.abs();
    var r = from.x + stepR;
    var c = from.y + stepC;
    while (r != target.x || c != target.y) {
      if (board[r][c] != null) return false;
      r += stepR;
      c += stepC;
    }
    return true;
  }

  bool _inCheck(Side side, List<List<_Piece?>> board) {
    Point<int>? king;
    for (var r = 0; r < 8; r++) {
      for (var c = 0; c < 8; c++) {
        if (board[r][c]?.type == PieceType.king && board[r][c]?.side == side)
          king = Point(r, c);
      }
    }
    if (king == null) return true;
    final enemy = _other(side);
    for (var r = 0; r < 8; r++) {
      for (var c = 0; c < 8; c++) {
        if (board[r][c]?.side == enemy && _attacks(Point(r, c), king, board))
          return true;
      }
    }
    return false;
  }

  void _applyMove(List<List<_Piece?>> board, _Move move) {
    final piece = board[move.from.x][move.from.y];
    if (piece == null) return;
    board[move.from.x][move.from.y] = null;
    if (move.enPassant)
      board[move.to.x + (piece.side == Side.white ? 1 : -1)][move.to.y] = null;
    board[move.to.x][move.to.y] = piece;
    piece.moved = true;
    if (move.castle) {
      final rookFrom = move.to.y > move.from.y ? 7 : 0;
      final rookTo = move.to.y > move.from.y ? 5 : 3;
      final rook = board[move.from.x][rookFrom];
      board[move.from.x][rookFrom] = null;
      board[move.from.x][rookTo] = rook;
      rook?.moved = true;
    }
  }

  Future<void> _play(_Move move) async {
    final piece = _board[move.from.x][move.from.y];
    if (piece == null) return;
    final wasDoublePawn =
        piece.type == PieceType.pawn && (move.to.x - move.from.x).abs() == 2;
    setState(() {
      _applyMove(_board, move);
      final promoted = _board[move.to.x][move.to.y];
      if (promoted?.type == PieceType.pawn &&
          (move.to.x == 0 || move.to.x == 7)) {
        _board[move.to.x][move.to.y] = _Piece(
          PieceType.queen,
          promoted!.side,
          moved: true,
        );
      }
      _enPassant = wasDoublePawn
          ? Point((move.from.x + move.to.x) ~/ 2, move.from.y)
          : null;
      _turn = _other(_turn);
      _selected = null;
      _moves = [];
      if (_turn == Side.white) _moveNumber++;
    });
    _updateStatus();
    _runBotIfNeeded();
  }

  void _updateStatus() {
    final available = _allLegal(_turn, _board);
    final check = _inCheck(_turn, _board);
    if (available.isEmpty) {
      setState(() {
        _finished = true;
        _status = check
            ? 'Skakmat! ${_turn == Side.white ? 'Hitam' : 'Putih'} menang.'
            : 'Remis: stalemate.';
      });
    } else {
      setState(
        () => _status =
            '${_turn == Side.white ? 'Giliran Putih' : 'Giliran Hitam'}${check ? ' — SKAK!' : ''}',
      );
    }
  }

  void _runBotIfNeeded() {
    final botTurn =
        _mode == ChessMode.botVsBot ||
        (_mode == ChessMode.playerVsBot && _turn == Side.black);
    if (!botTurn || _finished) return;
    _botTimer?.cancel();
    _botTimer = Timer(const Duration(milliseconds: 500), () {
      final available = _allLegal(_turn, _board);
      if (available.isNotEmpty)
        _play(available[Random().nextInt(available.length)]);
    });
  }

  @override
  void dispose() {
    _botTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_mode == null) return _modeSelection();
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('Game Catur'),
        backgroundColor: const Color(0xFF1E293B),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => setState(() => _mode = null),
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              _status,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          AspectRatio(aspectRatio: 1, child: _boardView()),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Langkah $_moveNumber  •  Klik bidak lalu klik petak tujuan',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF64748B)),
            ),
          ),
          if (_finished)
            ElevatedButton.icon(
              onPressed: () => _start(_mode!),
              icon: const Icon(Icons.refresh),
              label: const Text('Main Lagi'),
            ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Rokade • En passant • Promosi pion • Skak & skakmat',
              style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _modeSelection() => Scaffold(
    backgroundColor: const Color(0xFFF1F5F9),
    appBar: AppBar(
      title: const Text('Game Catur'),
      backgroundColor: const Color(0xFF1E293B),
      foregroundColor: Colors.white,
    ),
    body: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Pilih Mode Permainan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mainkan catur dengan aturan lengkap.',
              style: TextStyle(color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 28),
            _modeButton(
              'Player vs Player',
              Icons.people,
              ChessMode.playerVsPlayer,
            ),
            _modeButton('Player vs Bot', Icons.person, ChessMode.playerVsBot),
            _modeButton('Bot vs Bot', Icons.smart_toy, ChessMode.botVsBot),
          ],
        ),
      ),
    ),
  );

  Widget _modeButton(String label, IconData icon, ChessMode mode) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () => _start(mode),
        icon: Icon(icon),
        label: Text(label),
      ),
    ),
  );

  Widget _boardView() => GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 64,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 8,
    ),
    itemBuilder: (context, index) {
      final r = index ~/ 8;
      final c = index % 8;
      final piece = _board[r][c];
      final selected = _selected == Point(r, c);
      final possible = _moves.any((move) => move.to == Point(r, c));
      final light = (r + c).isEven;
      return GestureDetector(
        onTap: () => _tapSquare(r, c),
        child: Container(
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xFFFACC15)
                : light
                ? const Color(0xFFF0D9B5)
                : const Color(0xFFB58863),
            border: possible
                ? Border.all(color: const Color(0xFF22C55E), width: 3)
                : null,
          ),
          child: Center(
            child: Text(
              piece?.symbol ?? '',
              style: TextStyle(
                fontSize: 32,
                color: piece?.side == Side.white ? Colors.white : Colors.black,
                shadows: const [Shadow(color: Colors.black38, blurRadius: 2)],
              ),
            ),
          ),
        ),
      );
    },
  );
}
