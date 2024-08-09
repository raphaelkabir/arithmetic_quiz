import 'package:arithmetic_quiz/data/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizAnswers extends StatefulWidget {
  const QuizAnswers({super.key});

  @override
  State<StatefulWidget> createState() => _QuizAnswer();
}

class _QuizAnswer extends State<QuizAnswers> {
  final TextStyle textStyle = const TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    List<int> outerArray = [0, 2, 4];

    return Column(
        children: outerArray
            .map((int number) => Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(2, (index) {
                      return Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Consumer<Session>(
                            builder: (context, session, child) {
                          return ElevatedButton(
                              onPressed: () {
                                double answer = session
                                    .quiz.possibleAnswers[number + index].value;
                                if (session.submit(answer)) {
                                  setState(() {
                                    session.refreshQuiz();
                                  });
                                }
                              },
                              child: Text(
                                  session.quiz.possibleAnswers[number + index]
                                      .toString(),
                                  style: textStyle));
                        }),
                      ));
                    }),
                  ),
                )))
            .toList());
  }
}
