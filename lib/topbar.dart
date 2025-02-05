import 'package:flutter/material.dart';
import 'package:muslim_app/home_page.dart';
// import 'package:muslim_app/screens/home_page.dart'; // ✅ Importing HomePage

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF795548),
        title: const Center(
          child: Text(
            'MusApp',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: const HomePage(),
      backgroundColor: const Color(0xFFBDBDBD),
      // ✅ Loads HomePage
    );
  }
}
