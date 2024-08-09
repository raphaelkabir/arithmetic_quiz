import 'dart:math';

import 'package:arithmetic_quiz/data/quiz.dart';

List<(int, int, int)> multiplicationTable = List.generate(100, (index) {
  int leftOperand = 0;
  int rightOperand = 0;

  int length = index.toString().length;

  if (index == 100) {
    leftOperand = 10;
    rightOperand = 0;
  } else if (length == 2) {
    leftOperand = int.parse(index.toString()[0]);
    rightOperand = int.parse(index.toString()[1]);
  } else {
    leftOperand = 0;
    rightOperand = int.parse(index.toString()[0]);
  }

  rightOperand += 2;
  leftOperand += 1;

  return (leftOperand, rightOperand, leftOperand * rightOperand);
});

List<Number> _shuffleAndConvert(List<double> values) {
  values.shuffle();
  return List.generate(values.length, (index) {
    return Number(values[index].toDouble());
  });
}

Quiz multiplication() {
  int index = Random().nextInt(100);
  var multiplicationTableRow = multiplicationTable[index];

  int leftOperand = multiplicationTableRow.$1;
  int rightOperand = multiplicationTableRow.$2;
  int actualAnswer = multiplicationTableRow.$3;

  List<double> possibleAnswers = [
    ((leftOperand - 1) * rightOperand).toDouble(),
    ((leftOperand + 1) * rightOperand).toDouble(),
    (leftOperand * rightOperand).toDouble(),
    leftOperand * (rightOperand + 1),
    (leftOperand - 1) * (rightOperand - 1),
    (leftOperand + 1) * (rightOperand + 1)
  ];

  return Quiz(
      Number(leftOperand.toDouble()),
      Number(rightOperand.toDouble()),
      const Operation(OperationType.multi),
      Number(actualAnswer.toDouble()),
      _shuffleAndConvert(possibleAnswers));
}

Quiz division() {
  int index = Random().nextInt(100);
  var multiplicationTableRow = multiplicationTable[index];

  int multiplier = multiplicationTableRow.$1;
  int multiplicand = multiplicationTableRow.$2;
  int product = multiplicationTableRow.$3;

  int leftOperand = product;
  int rightOperand = product ~/ multiplicand;
  int actualAnswer = multiplicand;

  if (multiplier > multiplicand) {
    rightOperand = product ~/ multiplier;
    actualAnswer = multiplier;
  }

  List<double> possibleAnswers = [
    actualAnswer.toDouble(),
    actualAnswer + 1,
    actualAnswer + 2,
    actualAnswer - 1,
    actualAnswer - 2,
    actualAnswer + 3
  ];

  return Quiz(
      Number(leftOperand.toDouble()),
      Number(rightOperand.toDouble()),
      const Operation(OperationType.div),
      Number(actualAnswer.toDouble()),
      _shuffleAndConvert(possibleAnswers));
}

Quiz subtraction() {
  int leftOperand = Random().nextInt(102) + 2;
  int rightOperand = Random().nextInt(102) + 2;
  int actualAnswer = leftOperand - rightOperand;

  List<double> possibleAnswers = [
    actualAnswer.toDouble(),
    actualAnswer + 1,
    actualAnswer + 2,
    actualAnswer - 1,
    actualAnswer - 2,
    actualAnswer + 3
  ];

  return Quiz(
      Number(leftOperand.toDouble()),
      Number(rightOperand.toDouble()),
      const Operation(OperationType.sub),
      Number(actualAnswer.toDouble()),
      _shuffleAndConvert(possibleAnswers));
}

Quiz addition() {
  int leftOperand = Random().nextInt(102) + 2;
  int rightOperand = Random().nextInt(102) + 2;
  int actualAnswer = leftOperand + rightOperand;

  List<double> possibleAnswers = [
    actualAnswer.toDouble(),
    actualAnswer + 1,
    actualAnswer + 2,
    actualAnswer - 1,
    actualAnswer - 2,
    actualAnswer + 3
  ];

  return Quiz(
      Number(leftOperand.toDouble()),
      Number(rightOperand.toDouble()),
      const Operation(OperationType.add),
      Number(actualAnswer.toDouble()),
      _shuffleAndConvert(possibleAnswers));
}
