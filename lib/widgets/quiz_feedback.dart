import 'package:flutter/material.dart';

class QuizFeedback extends StatefulWidget {
  const QuizFeedback({super.key});

  @override
  State<StatefulWidget> createState() => _QuizFeedback();
}

class _QuizFeedback extends State<QuizFeedback> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          child: const Text(
            'Correct',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          child: const Text(
            'Incorrect',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
