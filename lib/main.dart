import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const AlFoodApp());
}

class AlFoodApp extends StatelessWidget {
  const AlFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlFood',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
