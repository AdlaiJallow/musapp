import 'package:flutter/material.dart';
import 'package:muslim_app/topbar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TopBar(),
    );
  }
}



// Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF795548),
//         title: const Center(
//           child: Text(
//             'Home Page',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       body: const Center(
//         child: Text('Welcome'),
//       ),
//     );
