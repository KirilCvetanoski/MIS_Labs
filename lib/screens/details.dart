// =============================
// lib/screens/exam_detail_screen.dart
// =============================
import 'package:flutter/material.dart';
import 'package:lab1/models/Exam.dart';


class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _two(int n) => n.toString().padLeft(2, '0');
  String _formatDate(DateTime dt) => '${_two(dt.day)}.${_two(dt.month)}.${dt.year}';
  String _formatTime(DateTime dt) => '${_two(dt.hour)}:${_two(dt.minute)}';

  String timeUntilText(DateTime target) {
    final now = DateTime.now();
    Duration diff = target.difference(now);

    if (diff.isNegative) {
      diff = now.difference(target);
      final days = diff.inDays;
      final hours = diff.inHours % 24;
      return 'Испитот беше пред $days дена, $hours часа';
    }

    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Детален преглед')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.event),
              const SizedBox(width: 8),
              Text(_formatDate(exam.dateTime)),
              const SizedBox(width: 16),
              const Icon(Icons.access_time),
              const SizedBox(width: 8),
              Text(_formatTime(exam.dateTime)),
            ]),
            const SizedBox(height: 12),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.meeting_room),
              const SizedBox(width: 8),
              Expanded(child: Text(exam.rooms.join(', '))),
            ]),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: exam.isPast ? scheme.errorContainer : scheme.secondaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    exam.isPast ? Icons.schedule : Icons.hourglass_bottom,
                    color: exam.isPast ? scheme.onErrorContainer : scheme.onSecondaryContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      exam.isPast
                          ? timeUntilText(exam.dateTime)
                          : 'Преостанува: ${timeUntilText(exam.dateTime)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: exam.isPast ? scheme.onErrorContainer : scheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}