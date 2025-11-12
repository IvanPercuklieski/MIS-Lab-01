import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(title: const Text("Детали за испит"), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.subject, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.blue[700], size: 20),
                const SizedBox(width: 12),
                Text('Датум: ${dateFormat.format(exam.dateTime)}', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.blue[700], size: 20),
                const SizedBox(width: 12),
                Text('Време: ${timeFormat.format(exam.dateTime)}', style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue[700], size: 20),
                const SizedBox(width: 12),
                Expanded(child: Text('Простории: ${exam.rooms.join(', ')}', style: const TextStyle(fontSize: 16))),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: exam.isPast ? Colors.red[50] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: exam.isPast ? Colors.red : Colors.blue, width: 1),
              ),
              child: Row(
                children: [
                  Icon(
                    exam.isPast ? Icons.event_busy : Icons.schedule,
                    color: exam.isPast ? Colors.red[700] : Colors.blue[700],
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      exam.getRemainingTime(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: exam.isPast ? Colors.red[900] : Colors.blue[900],
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
