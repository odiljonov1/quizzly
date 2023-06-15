import 'dart:math';

import '../../models/quiz_model.dart';

abstract class QuizData {
  static List<Quiz> levelOne() {
    List<Quiz> list = [];
    List<String> operators = ['+', '-', '/', '*'];
    for (int i = 0; i < 10; i++) {
      operators.shuffle();
      String operator = operators[0];
      int intOne = Random().nextInt(5) + 1;
      int intTwo = Random().nextInt(5) + 1;
      int trueanswer = operator == '+'
          ? intOne + intTwo
          : (operator == '-'
              ? intOne - intTwo
              : (operator == '*' ? intOne * intTwo : intOne ~/ intTwo));
      List<num> answer = [
        trueanswer,
        Random().nextInt(25) + 1,
        Random().nextInt(25) + 1,
        Random().nextInt(25) + 1,
      ];
      answer.shuffle();
      list.add(
        Quiz(
          numberOne: intOne,
          numberTwo: intTwo,
          operator: operators[0],
          answers: answer,
          trueAnswers: trueanswer,
          second: 1000,
        ),
      );
    }
    return list;
  }

  static List<Quiz> levelTwo() {
    List<Quiz> list = [];
    List<String> operators = ['+', '-', '/', '*'];
    for (int i = 0; i < 10; i++) {
      operators.shuffle();
      String operator = operators[0];
      int intOne = Random().nextInt(10) + 1;
      int intTwo = Random().nextInt(10) + 1;
      int trueanswer = operator == '+'
          ? intOne + intTwo
          : (operator == '-'
          ? intOne - intTwo
          : (operator == '*' ? intOne * intTwo : intOne ~/ intTwo));
      List<num> answer = [
        trueanswer,
        Random().nextInt(100) + 1,
        Random().nextInt(100) + 1,
        Random().nextInt(100) + 1,
      ];
      answer.shuffle();
      list.add(
        Quiz(
          numberOne: intOne,
          numberTwo: intTwo,
          operator: operators[0],
          answers: answer,
          trueAnswers: trueanswer,
          second: 20,
        ),
      );
    }
    return list;
  }

  static List<Quiz> levelThree() {
    List<Quiz> list = [];
    List<String> operators = ['+', '-', '/', '*'];
    for (int i = 0; i < 10; i++) {
      operators.shuffle();
      String operator = operators[0];
      int intOne = Random().nextInt(20) + 1;
      int intTwo = Random().nextInt(20) + 1;
      int trueanswer = operator == '+'
          ? intOne + intTwo
          : (operator == '-'
          ? intOne - intTwo
          : (operator == '*' ? intOne * intTwo : intOne ~/ intTwo));
      List<num> answer = [
        trueanswer,
        Random().nextInt(400) + 1,
        Random().nextInt(400) + 1,
        Random().nextInt(400) + 1,
      ];
      answer.shuffle();
      list.add(
        Quiz(
          numberOne: intOne,
          numberTwo: intTwo,
          operator: operators[0],
          answers: answer,
          trueAnswers: trueanswer,
          second: 10,
        ),
      );
    }
    return list;
  }
}
