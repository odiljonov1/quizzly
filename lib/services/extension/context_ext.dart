import 'package:flutter/cupertino.dart';
import 'package:quizzly/controller/lang_controller.dart';

extension CustomLang on BuildContext{
  LangController get mode => LangController.instance;
}