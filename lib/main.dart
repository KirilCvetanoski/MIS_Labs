import 'package:flutter/material.dart';
import 'screens/list.dart';

void main() {
  runApp(const ExamsApp());
}

class ExamsApp extends StatelessWidget {
  const ExamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exams',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2E7D32),
      ),
      home: const ExamListScreen(indexNumber: '212031'), 
    );
  }
}
