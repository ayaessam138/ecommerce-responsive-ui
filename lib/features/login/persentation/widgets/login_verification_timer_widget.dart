import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class LoginVerificationTimerWidget extends StatefulWidget {
  const LoginVerificationTimerWidget({super.key});

  @override
  State<LoginVerificationTimerWidget> createState() =>
      LoginVerificationTimerWidgetState();
}

class LoginVerificationTimerWidgetState
    extends State<LoginVerificationTimerWidget> {
  late Timer _timer;
  int _remainingSeconds = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString();
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void disposeTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      _remainingSeconds = 120;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "${AppStrings.requestANewVerificationCode(context: context)} ${_formatTime(_remainingSeconds)}",
      maxLines: 1,
      style: TextStyles.font14Regular.copyWith(color: ColorsManager.greyColor),
    );
  }
}
