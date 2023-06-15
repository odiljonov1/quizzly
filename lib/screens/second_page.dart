import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzly/components/timer.dart';
import 'package:quizzly/services/constants/colors/app_colors.dart';
import 'package:quizzly/services/constants/images/app_image.dart';
import 'package:quizzly/services/constants/text_style/text_styles.dart';
import 'package:quizzly/services/l10n/app_localizations.dart';

import '../components/solve_quiz_page_components.dart';
import '../controller/second_page_controller..dart';
import '../models/quiz_model.dart';

class SecondPage extends StatefulWidget {
  static const id = "/SecondPage";
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late final SecondPageController controller;
  late final AppLocalizations l10n;
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    List<Quiz> quizData =
    ModalRoute.of(context)!.settings.arguments as List<Quiz>;
    controller = SecondPageController(
      updater: setState,
      dataQuiz: quizData,
      quiz: quizData.first,
    );
    l10n = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,

                /// Upper Container with image

                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AppImage.imageUpper,
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topLeft,
                    /// Back Button
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 40, left: 20),
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,

                /// Middle container

                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      const Spacer(flex: 1),

                     for(int i = 0; i< controller.quiz.answers.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
                        child: MyElevatedButton(
                          text: "${controller.quiz.answers[i]}",
                          height: 55, onPressed: () => controller.changeQuiz(controller.quiz.answers[i], context),
                        ),
                      ),


                      const Spacer(flex: 6),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,

                /// Footer Container

                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Align(
                    alignment: const Alignment(0, 0),
                    child: Text(
                      l10n.str_choose,
                      style:
                          AppTextStyles.dmsans20.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// Question Container

          Stack(
            children: [
              Align(
                alignment: const Alignment(-1, -0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFFBECFF),
                              offset: Offset(0, 3),
                              spreadRadius: 0.5),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child:  Column(
                      children: [
                        const SizedBox(height: 60),
                        Text("Question ${(controller.currentQuiz +1).toString().padLeft(2,"0")}/${controller.dataQuiz.length}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(height: 15),
                         Text(
                          "${controller.quiz.numberOne}  ${controller.quiz.operator}  ${controller.quiz.numberTwo} = ? ",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              ),
              Align(
                alignment: const Alignment(-0,-0.65),
                child: Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: controller.quiz.second == 1000
                      ? Container(
                    decoration: BoxDecoration(
                      color:controller.quiz.second == 1000
                          ? AppColors.mainColor
                          : AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.infinite,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  )
                      : TimerSeconds(
                    controller: controller,
                    color: AppColors.mainColor,
                    second: controller.quiz.second,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
