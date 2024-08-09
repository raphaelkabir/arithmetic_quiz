import 'package:arithmetic_quiz/data/session.dart';
import 'package:arithmetic_quiz/widgets/quiz_answers.dart';
import 'package:arithmetic_quiz/widgets/quiz_selection.dart';
import 'package:arithmetic_quiz/widgets/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Session(),
        child: Scaffold(
            appBar: AppBar(
              title: Container(),
            ),
            body: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const QuizSelection()),
                const Expanded(child: QuizView()),
                Expanded(
                  child: Container(
                      margin:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: const QuizAnswers()),
                ),
                Container(
                  height: 28,
                )
              ],
            )));
  }
}
