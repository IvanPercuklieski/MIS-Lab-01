import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subject: "Мобилни информациски системи", dateTime: DateTime(2025, 11, 15, 10, 0), rooms: ["211", "212"]),
    Exam(subject: "Веб програмирање", dateTime: DateTime(2024, 11, 18, 14, 0), rooms: ["305"]),
    Exam(subject: "Бази на податоци", dateTime: DateTime(2023, 11, 20, 9, 0), rooms: ["101", "102", "103"]),
    Exam(subject: "Оперативни системи", dateTime: DateTime(2025, 11, 22, 11, 0), rooms: ["201"]),
    Exam(subject: "Компјутерски мрежи", dateTime: DateTime(2025, 11, 25, 13, 0), rooms: ["310", "311"]),
    Exam(subject: "Вештачка интелигенција", dateTime: DateTime(2025, 11, 28, 10, 0), rooms: ["215"]),
    Exam(subject: "Алгоритми и податочни структури", dateTime: DateTime(2025, 12, 2, 12, 0), rooms: ["405", "406"]),
    Exam(subject: "Софтверско инженерство", dateTime: DateTime(2025, 12, 5, 9, 30), rooms: ["301"]),
    Exam(subject: "Математика 3", dateTime: DateTime(2025, 11, 10, 8, 0), rooms: ["Амфитеатар 1"]),
    Exam(subject: "Дискретни структури", dateTime: DateTime(2025, 12, 8, 14, 0), rooms: ["202", "203"]),
    Exam(subject: "Компјутерска графика", dateTime: DateTime(2025, 12, 10, 11, 0), rooms: ["Lab 1", "Lab 2"]),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(title: const Text("Распоред за испити - 225048"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, -2))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(Icons.assignment, color: Colors.blue[700], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "Вкупно испити: ${exams.length}",
                        style: TextStyle(color: Colors.blue[700], fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
