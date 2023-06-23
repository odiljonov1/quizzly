import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizzly/controller/lang_controller.dart';
import 'package:quizzly/screens/second_page.dart';
import 'package:quizzly/screens/third_page.dart';
import 'package:quizzly/services/constants/colors/app_colors.dart';
import 'package:quizzly/services/extension/context_ext.dart';
import 'package:quizzly/services/l10n/app_localizations.dart';

import 'screens/first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LangController.currentLang,
      builder: (context, lang, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const FirstPage(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(lang),

          theme: ThemeData(
            fontFamily: "DMSans",
            splashColor: AppColors.whiteColor,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.white.withOpacity(0.6)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    side:
                        const BorderSide(color: AppColors.whiteColor, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                fixedSize: MaterialStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 65)),
                backgroundColor:
                    const MaterialStatePropertyAll(AppColors.mainColor),
              ),
            ),
          ),
          routes: {
            FirstPage.id: (context) => const FirstPage(),
            SecondPage.id: (context) => const SecondPage(),
            ThirdPage.id: (context) => const ThirdPage(),
          },
        );
      },
    );
  }
}