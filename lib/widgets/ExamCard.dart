import 'package:flutter/material.dart';
import 'package:lab1/models/Exam.dart';


class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  String _two(int n) => n.toString().padLeft(2, '0');

  String _formatDate(DateTime dt) =>
      '${_two(dt.day)}.${_two(dt.month)}.${dt.year}';
  String _formatTime(DateTime dt) => '${_two(dt.hour)}:${_two(dt.minute)}';

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool isPast = exam.isPast;

    final Color cardColor = isPast
        ? scheme.surfaceVariant
        : scheme.primaryContainer;
    final Color textColor = isPast ? scheme.onSurfaceVariant : scheme.onPrimaryContainer;

    return Card(
      elevation: 2,
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.menu_book, color: textColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.subjectName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isPast ? scheme.errorContainer : scheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      isPast ? 'Поминат' : 'Иден',
                      style: TextStyle(
                        color: isPast ? scheme.onErrorContainer : scheme.onTertiaryContainer,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.event, color: textColor),
                  const SizedBox(width: 8),
                  Text(_formatDate(exam.dateTime), style: TextStyle(color: textColor)),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, color: textColor),
                  const SizedBox(width: 8),
                  Text(_formatTime(exam.dateTime), style: TextStyle(color: textColor)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.meeting_room, color: textColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



