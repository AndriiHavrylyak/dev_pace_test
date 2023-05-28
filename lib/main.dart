import 'package:flutter/material.dart';

import 'features/main/pages/main_page.dart';

void main() {
  runApp(const DevPaceApp());
}

class DevPaceApp extends StatelessWidget {
  const DevPaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevPace  App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
