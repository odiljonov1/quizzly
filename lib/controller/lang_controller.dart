

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LangController {
  LangController._();
  static LangController instance = LangController._();

  static Future<void> initLang() async {
    await Hive.initFlutter();
    await Hive.openBox<String>("settings");
  }


  static Box<String > langBox = Hive.box<String>("settings");
  static ValueNotifier<String> currentLang = ValueNotifier<String>(langBox.get("currentLang", defaultValue: "us")!);

  List<String> languages = [
    'uz',
    'ru',
    'us',
  ];

  void  changeLang(String? lan){
    currentLang.value = lan!;
    langBox.put("currentLang", lan);
  }
}