import 'package:arithmetic_quiz/data/quiz.dart';
import 'package:arithmetic_quiz/data/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizSelection extends StatefulWidget {
  const QuizSelection({super.key});

  @override
  State<StatefulWidget> createState() => _QuizSelection();
}

class _QuizSelection extends State<QuizSelection> {
  OperationType operationType = OperationType.multi;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
        selectedIcon: const Icon(Icons.check_circle_outline),
        segments: const <ButtonSegment<OperationType>>[
          ButtonSegment<OperationType>(
              value: OperationType.add,
              label: Text('Add'),
              icon: Icon(Icons.circle_outlined)),
          ButtonSegment<OperationType>(
              value: OperationType.sub,
              label: Text('Sub'),
              icon: Icon(Icons.circle_outlined)),
          ButtonSegment<OperationType>(
              value: OperationType.multi,
              label: Text('Multi'),
              icon: Icon(Icons.circle_outlined)),
          ButtonSegment<OperationType>(
              value: OperationType.div,
              label: Text('Div'),
              icon: Icon(Icons.circle_outlined))
        ],
        selected: <OperationType>{operationType},
        onSelectionChanged: (newValue) {
          setState(() {
            operationType = newValue.first;
            Provider.of<Session>(context, listen: false)
                .refreshQuiz(operationType);
          });
        });
  }
}
