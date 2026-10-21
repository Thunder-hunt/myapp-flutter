import 'dart:async';
import 'package:flutter/material.dart';

class DinoGameWidget extends StatefulWidget {
  const DinoGameWidget({super.key});

  @override
  State<DinoGameWidget> createState() => _DinoGameWidgetState();
}

class _DinoGameWidgetState extends State<DinoGameWidget> {
  static const double _groundHeight = 74;
  static const double _dinoSize = 48;
  static const double _dinoX = 48;
  static const double _gravity = 0.95;
  static const double _jumpPower = -15;

  Timer? _gameTimer;
  double _dinoY = 0;
  double _dinoVelocity = 0;
  double _obstacleX = 1;
  int _score = 0;
  bool _isPlaying = false;
  bool _isGameOver = false;
  double _gameWidth = 0;
  double _gameHeight = 0;

  void _startGame() {
    _gameTimer?.cancel();
    setState(() {
      _dinoY = 0;
      _dinoVelocity = 0;
      _obstacleX = 1;
      _score = 0;
      _isPlaying = true;
      _isGameOver = false;
    });
    _gameTimer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      _updateGame();
    });
  }

  void _updateGame() {
    if (!_isPlaying || _gameWidth == 0 || _gameHeight == 0) return;

    final obstacleSpeed = 0.012 + (_score * 0.00015).clamp(0, 0.008);
    setState(() {
      _dinoVelocity += _gravity;
      _dinoY += _dinoVelocity;
      if (_dinoY > 0) {
        _dinoY = 0;
        _dinoVelocity = 0;
      }

      _obstacleX -= obstacleSpeed;
      if (_obstacleX < -0.12) {
        _obstacleX = 1.05;
        _score++;
      }
    });

    if (_hasCollided()) _endGame();
  }

  bool _hasCollided() {
    final groundY = _gameHeight - _groundHeight;
    final dinoBottom = groundY + _dinoY;
    final dinoLeft = _dinoX + 7;
    final dinoRight = _dinoX + _dinoSize - 7;
    final obstacleLeft = _obstacleX * _gameWidth;
    const obstacleWidth = 28.0;
    final obstacleRight = obstacleLeft + obstacleWidth;
    const obstacleHeight = 44.0;
    final obstacleTop = groundY - obstacleHeight;
    final dinoTop = dinoBottom - _dinoSize;

    return dinoRight > obstacleLeft &&
        dinoLeft < obstacleRight &&
        dinoBottom > obstacleTop &&
        dinoTop < groundY;
  }

  void _endGame() {
    _gameTimer?.cancel();
    setState(() {
      _isPlaying = false;
      _isGameOver = true;
    });
  }

  void _jump() {
    if (!_isPlaying) {
      _startGame();
      return;
    }
    if (_dinoY == 0) {
      setState(() => _dinoVelocity = _jumpPower);
    }
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Dino Jump'),
        backgroundColor: const Color(0xFF334155),
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          _gameWidth = constraints.maxWidth;
          _gameHeight = constraints.maxHeight;
          return GestureDetector(
            onTap: _jump,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size.infinite,
                  painter: _DinoPainter(
                    dinoY: _dinoY,
                    obstacleX: _obstacleX,
                    groundHeight: _groundHeight,
                    dinoSize: _dinoSize,
                    dinoX: _dinoX,
                    isPlaying: _isPlaying,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Text(
                    'SKOR  $_score',
                    style: const TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (!_isPlaying)
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 18),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _isGameOver ? 'Game Over' : 'Dino Jump',
                            style: const TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isGameOver
                                ? 'Skor kamu: $_score'
                                : 'Tap layar untuk melompat',
                            style: const TextStyle(color: Color(0xFF64748B)),
                          ),
                          const SizedBox(height: 18),
                          ElevatedButton.icon(
                            onPressed: _startGame,
                            icon: Icon(
                              _isGameOver
                                  ? Icons.refresh_rounded
                                  : Icons.play_arrow_rounded,
                            ),
                            label: Text(_isGameOver ? 'Main Lagi' : 'Mulai'),
                          ),
                        ],
                      ),
                    ),
                  ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 18,
                  child: Text(
                    'TAP UNTUK LOMPAT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DinoPainter extends CustomPainter {
  const _DinoPainter({
    required this.dinoY,
    required this.obstacleX,
    required this.groundHeight,
    required this.dinoSize,
    required this.dinoX,
    required this.isPlaying,
  });

  final double dinoY;
  final double obstacleX;
  final double groundHeight;
  final double dinoSize;
  final double dinoX;
  final bool isPlaying;

  @override
  void paint(Canvas canvas, Size size) {
    final groundY = size.height - groundHeight;
    final groundPaint = Paint()..color = const Color(0xFFCBD5E1);
    canvas.drawRect(Rect.fromLTWH(0, groundY, size.width, 2), groundPaint);

    final dinoPaint = Paint()..color = const Color(0xFF16A34A);
    final dinoRect = Rect.fromLTWH(
      dinoX,
      groundY - dinoSize + dinoY,
      dinoSize,
      dinoSize,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(dinoRect, const Radius.circular(8)),
      dinoPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(dinoX + dinoSize - 8, dinoRect.top + 9, 15, 16),
      dinoPaint,
    );
    final eyePaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(dinoX + 37, dinoRect.top + 12), 3, eyePaint);

    final obstaclePaint = Paint()..color = const Color(0xFFB45309);
    final obstacleLeft = obstacleX * size.width;
    final obstacleRect = Rect.fromLTWH(obstacleLeft, groundY - 44, 28, 44);
    canvas.drawRRect(
      RRect.fromRectAndRadius(obstacleRect, const Radius.circular(5)),
      obstaclePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(obstacleLeft - 8, groundY - 29, 9, 6),
      obstaclePaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(obstacleLeft + 27, groundY - 20, 9, 6),
      obstaclePaint,
    );

    if (!isPlaying) {
      final linePaint = Paint()
        ..color = const Color(0xFFE2E8F0)
        ..strokeWidth = 1;
      canvas.drawLine(
        Offset(0, groundY + 12),
        Offset(size.width, groundY + 12),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DinoPainter oldDelegate) => true;
}
