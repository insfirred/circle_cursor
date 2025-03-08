import 'package:circle_cursor/circle_cursor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircleCursor(
        innerPointerColor: Colors.purple,
        outerPointerColor: Colors.purple,
        innerPointerRadius: 12,
        outerPointerRadius: 60,
        outerPointerWidth: 4,
        child: Center(
          child: Text(
            'Hover your cursor anywhere on screen',
          ),
        ),
      ),
    );
  }
}
