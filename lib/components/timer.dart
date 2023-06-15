import 'package:flutter/material.dart';
import 'package:quizzly/services/constants/colors/app_colors.dart';

import '../controller/second_page_controller..dart';
import 'custom_timer_painter.dart';

class TimerSeconds extends StatefulWidget {
  final Color color;
  final int second;
  final SecondPageController controller;

  const TimerSeconds({
    super.key,
    required this.color,
    required this.second,
    required this.controller,
  });

  @override
  State<TimerSeconds> createState() => _TimerSecondsState();
}

class _TimerSecondsState extends State<TimerSeconds>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return (((duration.inSeconds + 1) % 60)).toString().padLeft(2, '0');
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.second),
    );
    widget.controller.animationController = controller;
    controller.reverse(
      from: controller.value == 0.0 ? 1.0 : controller.value,
    );
    controller.addStatusListener(
        (status) => widget.controller.changer(status, context));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
        painter: CustomTimerPainter(
          animation: controller,
          backgroundColor: Colors.white,
          color: widget.color,
        ),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Center(
              child: Text(
            timerString,
            style: const TextStyle(
                color: AppColors.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
