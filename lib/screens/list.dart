
import 'package:flutter/material.dart';
import 'package:lab1/models/Exam.dart';
import '../widgets/ExamCard.dart';
import 'details.dart';

class ExamListScreen extends StatefulWidget {
  final String indexNumber;

  const ExamListScreen({super.key, required this.indexNumber});

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  late List<Exam> _exams;

  @override
  void initState() {
    super.initState();
    _exams = _seedExams();
    _exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  List<Exam> _seedExams() {
    // Статички (hardcoded) податоци – најмалку 10 испити, дел поминати
    return [
      Exam(subjectName: 'Алгоритми и Структури на Податоци', dateTime: DateTime(2025, 11, 2, 9, 0), rooms: const ['AMF-1', 'AMF-2']),
      Exam(subjectName: 'Објектно Ориентирано Програмирање', dateTime: DateTime(2025, 11, 5, 12, 0), rooms: const ['LAB-3']),
      Exam(subjectName: 'Веројатност и Статистика', dateTime: DateTime(2025, 11, 14, 9, 30), rooms: const ['A1', 'A2']),
      Exam(subjectName: 'Оперативни Системи', dateTime: DateTime(2025, 11, 20, 10, 0), rooms: const ['B3']),
      Exam(subjectName: 'Бази на Податоци', dateTime: DateTime(2025, 11, 22, 13, 0), rooms: const ['LAB-1', 'LAB-2']),
      Exam(subjectName: 'Компјутерски Мрежи', dateTime: DateTime(2025, 11, 25, 8, 0), rooms: const ['C4']),
      Exam(subjectName: 'Мобилни Апликации', dateTime: DateTime(2025, 12, 1, 15, 0), rooms: const ['D1']),
      Exam(subjectName: 'Веб Програмирање', dateTime: DateTime(2025, 12, 3, 10, 30), rooms: const ['E2']),
      Exam(subjectName: 'Инженерство на Софтвер', dateTime: DateTime(2025, 12, 10, 9, 0), rooms: const ['F5']),
      Exam(subjectName: 'Вештачка Интелигенција', dateTime: DateTime(2025, 12, 15, 11, 0), rooms: const ['G6']),
      Exam(subjectName: 'Компјутерска Графика', dateTime: DateTime(2025, 12, 18, 14, 0), rooms: const ['H7']),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - ${widget.indexNumber}'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _exams.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final exam = _exams[i];
          return ExamCard(
            exam: exam,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Вкупно испити', style: TextStyle(fontWeight: FontWeight.w600)),
              Chip(
                label: Text('${_exams.length}'),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

