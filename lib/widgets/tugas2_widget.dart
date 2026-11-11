import 'package:flutter/material.dart';

class Tugas2Widget extends StatelessWidget {
  const Tugas2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFBF8FC),
        appBar: AppBar(
          title: const Text(
            'Tugas 2',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          backgroundColor: const Color(0xFF5B67F2),
        ),
        body: const Center(
          child: Text(
            'Halaman Tugas 2',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: const Color(0xFF5B67F2),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
