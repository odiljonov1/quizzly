import 'package:flutter/cupertino.dart';
import '../../../screens/first_page.dart';
import '../../../screens/second_page.dart';
import '../../../screens/third_page.dart';

bool isAuth = false;

class AppRoutes {
  AppRoutes._();

  static String get initialRoute => FirstPage.id;

  static final routes = {
  FirstPage.id : (context) => const FirstPage(),
  SecondPage.id : (context) => const SecondPage(),
  ThirdPage.id : (context) => const ThirdPage(),
  };

  static void goToIntro(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      FirstPage.id,
      ModalRoute.withName(FirstPage.id),
    );
  }
}