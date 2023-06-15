import 'package:flutter/cupertino.dart';
import 'package:quizzly/models/quiz_model.dart';

import '../services/constants/app_routes/routes.dart';
import 'first_page_controller.dart';

class SecondPageController {
  void Function(void Function() func) updater;

  late List<Quiz> dataQuiz;


  SecondPageController({
    required this.updater,
  });

  int get correct =>
      dataQuiz
          .where((element) => element.answer == 1)
          .toList()
          .length;

  int get inCorrect =>
      dataQuiz
          .where((element) => element.answer != 1)
          .toList()
          .length;

  num get score => (100 / dataQuiz.length) * correct;


  void tryAgain(BuildContext context) {
    FirstPageController.currentLevel(context);
  }

  void gotoIntro(BuildContext context) {
    AppRoutes.goToIntro(context);
  }
}