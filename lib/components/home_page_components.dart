import 'package:flutter/material.dart';
import 'package:quizzly/controller/first_page_controller.dart';
import 'package:quizzly/services/l10n/app_localizations.dart';
import '../services/constants/colors/app_colors.dart';
import '../services/constants/text_style/text_styles.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      height: 205,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            l10n.str_welcome,
            style: AppTextStyles.dmsans28.copyWith(
              color: AppColors.introTextColor,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            l10n.str_with,
            style: AppTextStyles.dmsans22
                .copyWith(color: AppColors.introTextColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MyTextButton extends StatefulWidget {
  final FirstPageController controller;
  void Function()? onPressed;
  String text;

  MyTextButton({
    required this.text,
    required this.controller,
    required this.onPressed,
    super.key,
  });

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: AppTextStyles.dmsans20.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
