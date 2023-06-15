import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzly/controller/third_page_controller.dart';
import 'package:quizzly/models/quiz_model.dart';
import 'package:quizzly/services/constants/icons/app_icons.dart';
import 'package:quizzly/services/l10n/app_localizations.dart';

import '../components/solve_quiz_page_components.dart';
import '../services/constants/colors/app_colors.dart';
import '../services/constants/images/app_image.dart';
import '../services/constants/text_style/text_styles.dart';
import 'first_page.dart';

class ThirdPage extends StatefulWidget {
  static const id = "/ThirdPage";

  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late final SecondPageController controller;
  late final AppLocalizations l10n;

  @override
  void initState() {
    controller = SecondPageController(updater: setState);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    List<Quiz> data = ModalRoute.of(context)!.settings.arguments as List<Quiz>;
    controller.dataQuiz = data;
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
                flex: 8,

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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, FirstPage.id, (route) => false);
                        },
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 50, left: 25),
                            child: Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18, top: 18),
                            child: Container(
                              height: 142,
                              width: 142,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 29, top: 29),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      l10n.str_score,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.dmsans20
                                          .copyWith(color: AppColors.mainColor),
                                    ),
                                    Text("${controller.score.toInt()}",
                                    textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.mainColor)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

                      /// First Button
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: MyElevatedButton(
                          text: l10n.str_play,
                          height: 55,
                          onPressed: () {
                            controller.tryAgain(context);
                          },
                        ),
                      ),
                      const Spacer(flex: 2),

                      /// Second Button
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: MyElevatedButton(
                          text: l10n.str_home,
                          height: 55,
                          onPressed: () {
                            controller.gotoIntro(context);
                          },
                        ),
                      ),
                      const Spacer(flex: 2),

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
                      l10n.str_quizzly,
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
                alignment: const Alignment(-1, -0.2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700,
                            offset: const Offset(0, 4),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width,
                    height: 135,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 65),
                              child: Row(
                                children: [
                                  const Image(
                                    image: AppIcons.greenIcon,
                                    width: 13,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.correct}",
                                    style: AppTextStyles.dmsans20
                                        .copyWith(color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              l10n.str_correct,
                              style: AppTextStyles.dmsans14,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Row(
                                children: [
                                  const Image(
                                    image: AppIcons.redIcon,
                                    width: 13,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${controller.inCorrect}",
                                    style: AppTextStyles.dmsans20
                                        .copyWith(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              l10n.str_wrong,
                              style: AppTextStyles.dmsans14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              LottieBuilder.asset("assets/lottie/62717-confetti.json",repeat: false,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
            ],
          ),
        ],
      ),
    );
  }
}
