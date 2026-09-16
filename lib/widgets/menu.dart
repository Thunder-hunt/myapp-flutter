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

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                MaterialPageRoute(builder: (context) => const SizeboxWidget()),
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
                MaterialPageRoute(builder: (context) => const PaddingWidget()),
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
        ],
      ),
    );
  }
}
