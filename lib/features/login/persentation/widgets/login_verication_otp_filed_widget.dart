import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../core/helpers/app_values.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theming/colors.dart';

class LoginVerificationOtpFiledWidget extends StatefulWidget {
  const LoginVerificationOtpFiledWidget({super.key});

  @override
  State<LoginVerificationOtpFiledWidget> createState() =>
      _LoginVerificationOtpFiledWidgetState();
}

class _LoginVerificationOtpFiledWidgetState
    extends State<LoginVerificationOtpFiledWidget> {
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      borderRadius: BorderRadius.circular(AppRadius.r12),
      fieldWidth: AppWidth.w55,
      fieldHeight: AppHeight.h56,
      numberOfFields: 4,
      focusedBorderColor: ColorsManager.mainColor,
      borderColor: ColorsManager.greyColor,
      keyboardType: TextInputType.number,
      showFieldAsBox: true,
      onCodeChanged: (String code) {
        setState(() {
          // enteredOtp = code;
        });
      },
      onSubmit: (String verificationCode) {
        setState(() {
          // enteredOtp = verificationCode;
          AppNavigator.goNamed(context, AppRoutes.setUpPasswordRoute);
        });
      },
    );
  }
}
