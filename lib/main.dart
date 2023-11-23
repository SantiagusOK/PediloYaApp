import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PediloYaApp(),
    );
  }
}

class PediloYaApp extends StatefulWidget {
  const PediloYaApp({super.key});

  @override
  State<PediloYaApp> createState() => _PediloYaAppState();
}

class _PediloYaAppState extends State<PediloYaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
