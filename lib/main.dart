import 'package:flutter/material.dart';
import 'package:quizzly/controller/lang_controller.dart';
import 'app.dart';

void main() async {
  await LangController.initLang();
  runApp(const MyApp());
}
