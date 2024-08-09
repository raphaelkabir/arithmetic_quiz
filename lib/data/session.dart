import 'package:arithmetic_quiz/data/quiz.dart';
import 'package:arithmetic_quiz/data/quiz_generation.dart';
import 'package:flutter/material.dart';

class Session extends ChangeNotifier {
  Quiz quiz = _generateQuiz(OperationType.multi);

  bool submit(double answer) {
    return answer == quiz.actualAnswer.value;
  }

  void refreshQuiz([OperationType? operationType]) {
    if (operationType != null) {
      quiz = _generateQuiz(operationType);
    } else {
      quiz = _generateQuiz(quiz.operation.operationType);
    }
    notifyListeners();
  }

  static Quiz _generateQuiz(OperationType operationType) {
    switch (operationType) {
      case OperationType.multi:
        return multiplication();
      case OperationType.div:
        return division();
      case OperationType.sub:
        return subtraction();
      case OperationType.add:
        return addition();
      default:
        throw UnsupportedError('You shouldnt be here');
    }
  }
}
