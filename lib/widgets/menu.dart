import 'package:flutter/material.dart';
import 'package:oopdart/widgets/text_widget.dart';
import 'package:oopdart/widgets/container_widget.dart';
import 'package:oopdart/widgets/center_widget.dart';
import 'package:oopdart/widgets/image_widget.dart';
import 'package:oopdart/widgets/calculator_widget.dart';
import 'package:oopdart/widgets/lorem_widget.dart';
import 'package:oopdart/widgets/sizebox_widget.dart';
import 'package:oopdart/widgets/icon_widget.dart';
import 'package:oopdart/widgets/image_offline_widget.dart';
import 'package:oopdart/widgets/padding_widget.dart';
import 'package:oopdart/widgets/camera_widget.dart';
import 'package:oopdart/widgets/dino_game_widget.dart';
import 'package:oopdart/widgets/chess_widget.dart';
import 'package:oopdart/widgets/row_widget.dart';
import 'package:oopdart/widgets/column_widget.dart';

class _LayoutItem {
  const _LayoutItem(this.name, this.builder);

  final String name;
  final WidgetBuilder builder;
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutItems = <_LayoutItem>[
      _LayoutItem('Row', (context) => const RowWidget()),
      _LayoutItem('Column', (context) => const ColumnWidget()),
      _LayoutItem('Stack', (context) => const LayoutDemoPage(title: 'Stack')),
      _LayoutItem('Expanded', (context) => LayoutDemoPage(title: 'Expanded')),
      _LayoutItem('Flexible', (context) => LayoutDemoPage(title: 'Flexible')),
      _LayoutItem('Align', (context) => const LayoutDemoPage(title: 'Align')),
      _LayoutItem('Wrap', (context) => const LayoutDemoPage(title: 'Wrap')),
      _LayoutItem('ListView', (context) => LayoutDemoPage(title: 'ListView')),
      _LayoutItem('GridView', (context) => LayoutDemoPage(title: 'GridView')),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '1. Text Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContainerWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '2. Container Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CenterWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '3. Center Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImageWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '4. Image Widget (Online Link)',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageOfflineWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '5. Image Widget (in project)',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatorWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '6. Calculator Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoremWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '7. Lorem Ipsum',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SizeboxWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '8. Sizebox Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IconWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '9. Icon Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaddingWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '10. Padding Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '11. Camera Widget',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DinoGameWidget(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '12. Dino Jump Game',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChessWidget()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  '13. Game Catur',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              color: Colors.purpleAccent,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'LAYOUT WIDGET',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(height: 5, color: Colors.yellow),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: layoutItems.map((item) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: item.builder),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(item.name),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title Widget')),
      body: Center(
        child: Text(
          'Contoh layout $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
