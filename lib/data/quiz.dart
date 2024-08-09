class Quiz {
  Quiz(this.leftOperand, this.rightOperand, this.operation, this.actualAnswer,
      this.possibleAnswers);

  final Number leftOperand;
  final Number rightOperand;
  final Operation operation;
  final Number actualAnswer;

  final List<Number> possibleAnswers;
}

enum OperationType { add, sub, div, multi }

class Operation {
  const Operation(this.operationType);

  final OperationType operationType;

  @override
  String toString() {
    switch (operationType) {
      case OperationType.add:
        return '\u002B';
      case OperationType.sub:
        return '\u2212';
      case OperationType.div:
        return '\u00F7';
      case OperationType.multi:
        return '\u00D7';
    }
  }
}

class Number {
  const Number(this.value);

  final double value;

  @override
  String toString() {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }

    return value.toString();
  }
}
