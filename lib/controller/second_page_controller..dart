import 'package:flutter/cupertino.dart';
import 'package:quizzly/models/quiz_model.dart';
import 'package:quizzly/screens/third_page.dart';


class SecondPageController {
  void Function(void Function() func) updater;

  List<Quiz> dataQuiz;
  int currentQuiz = 0;
  Quiz quiz;
  late AnimationController animationController;
  bool isAnimated = false;

  SecondPageController({
    required this.updater,
    required this.dataQuiz,
    required this.quiz,
  });

  void changeQuiz(num? newAnswer, BuildContext context) {
    quiz.answer =
        newAnswer == null ? 0 : (newAnswer == quiz.trueAnswers ? 1 : 2);
    currentQuiz++;
    if (currentQuiz >= dataQuiz.length) {
      Navigator.pushNamed(context, ThirdPage.id, arguments: dataQuiz);
    } else {
      quiz = dataQuiz[currentQuiz];
      if (quiz.second != 1000) {
        isAnimated = true;
        animationController.reset();
        animationController.reverse(
          from: animationController.value == 0.0
              ? 1.0
              : animationController.value,
        );
      }
    }
    updater(() {});
  }

  void changer(AnimationStatus status, BuildContext context) {
    if (status == AnimationStatus.dismissed) {
      if (!isAnimated) {
        changeQuiz(null, context);
        isAnimated = false;
      }

      animationController.reverse(
          from: animationController.value == 0.0
              ? 1.0
              : animationController.value);
    }
  }
}
