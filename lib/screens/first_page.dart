import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:quizzly/controller/first_page_controller.dart';
import 'package:quizzly/controller/lang_controller.dart';
import 'package:quizzly/services/constants/images/app_image.dart';
import 'package:quizzly/services/constants/text_style/text_styles.dart';
import 'package:quizzly/services/extension/context_ext.dart';
import 'package:quizzly/services/l10n/app_localizations.dart';
import '../components/home_page_components.dart';
import '../services/constants/colors/app_colors.dart';

class FirstPage extends StatefulWidget {
  static const id = "/FirstPage";

  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late final FirstPageController controller;
  late final AppLocalizations l10n;

  @override
  void didChangeDependencies() {
    l10n = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = FirstPageController(updater: setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AppImage.image,
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Align(
                alignment: const Alignment(0.9, 0),
                child: ValueListenableBuilder(
                  valueListenable: LangController.currentLang,
                  builder: (context, lang, _) {
                    return DropdownButton(
                      dropdownColor: Colors.deepPurple,
                      value: lang,
                      items: LangController.instance.languages.map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleFlag(e, size: 20),
                          const SizedBox(width: 10),
                          Text((e == "us" ? "en" : e).toUpperCase()),
                        ],
                      ),
                    ),
                    ).toList(),// End Map,
                      onChanged: LangController.instance.changeLang,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  l10n.str_quizzly,
                  style: AppTextStyles.expletusSans67
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
              const SizedBox(height: 35),

              /// WhiteContainer with text

              const WhiteContainer(),
              const SizedBox(height: 50),
              Text(
                l10n.str_choose,
                style: AppTextStyles.dmsans24
                    .copyWith(color: AppColors.whiteColor),
              ),
              const Spacer(flex: 2),

              /// Level 1 Button

              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: MyTextButton(
                  text: l10n.str_level1,
                  controller: controller,
                  onPressed: () => FirstPageController.buttonLevelOne(context),
                ),
              ),
              const Spacer(flex: 2),

              /// Level 2 Button

              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: MyTextButton(
                  controller: controller,
                  onPressed: () => FirstPageController.buttonLevelTwo(context),
                  text: l10n.str_level2,
                ),
              ),
              const Spacer(flex: 2),

              ///  Level 3 Button

              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: MyTextButton(
                  controller: controller,
                  onPressed: () =>
                      FirstPageController.buttonLevelThree(context),
                  text: l10n.str_level3,
                ),
              ),
              const Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}
