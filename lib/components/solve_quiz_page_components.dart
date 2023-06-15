import 'package:flutter/material.dart';
import 'package:quizzly/services/constants/text_style/text_styles.dart';

import '../services/constants/colors/app_colors.dart';

class MyElevatedButton extends StatelessWidget {
  String text;
  double height;
  void Function()? onPressed;

  MyElevatedButton({super.key, required this.text, required this.height,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.whiteColor,
        fixedSize: Size(MediaQuery.of(context).size.width, height),
        side: const BorderSide(
          color: AppColors.mainColor,
          width: 2,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.dmsans20.copyWith(color: Colors.black),
      ),
    );
  }
}
