import 'package:arithmetic_quiz/data/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<StatefulWidget> createState() => _QuizView();
}

class _QuizView extends State<QuizView> {
  final TextStyle operandStyle = const TextStyle(fontSize: 64);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<Session>(builder: (context, session, child) {
          return Text(session.quiz.leftOperand.toString(), style: operandStyle);
        }),
        Consumer<Session>(builder: (context, session, child) {
          return Text(session.quiz.operation.toString(), style: operandStyle);
        }),
        Consumer<Session>(builder: (context, session, child) {
          return Text(session.quiz.rightOperand.toString(),
              style: operandStyle);
        })
      ],
    );
  }
}
