import 'dart:math';

class Quiz {
  int id;
  int numberOne;
  int numberTwo;
  String operator;
  List<num> answers;
  int answer = 0;
  int trueAnswers;
  int second;

  Quiz({
    required this.numberOne,
    required this.numberTwo,
    required this.operator,
    required this.answers,
    required this.trueAnswers,
    required this.second,

  }): id = Random().nextInt(1000);

  @override
  String toString() {
    return 'Quiz{id: $id, numberOne: $numberOne, numberTwo: $numberTwo, operator: $operator, answers: $answers, answer: $answer, trueAnswers: $trueAnswers, second: $second}';
  }


}
