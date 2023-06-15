import 'package:flutter/cupertino.dart';
import 'package:quizzly/services/database/quizzes.dart';

import '../screens/second_page.dart';

class FirstPageController {
  void Function(void Function() func) updater;

  FirstPageController({required this.updater});

  static void Function(BuildContext context) currentLevel = buttonLevelOne;

  static void buttonLevelOne(BuildContext context) {
    Navigator.of(context)
        .pushNamed(SecondPage.id, arguments: QuizData.levelOne());
  }

  static void buttonLevelTwo(BuildContext context) {
    Navigator.of(context)
        .pushNamed(SecondPage.id, arguments: QuizData.levelTwo());
  }

  static void buttonLevelThree(BuildContext context) {
    Navigator.of(context)
        .pushNamed(SecondPage.id, arguments: QuizData.levelThree());
  }
}
