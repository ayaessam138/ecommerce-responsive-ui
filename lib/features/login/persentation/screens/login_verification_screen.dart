import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/features/login/persentation/widgets/login_verification_timer_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/appbar_widget.dart';

import '../widgets/login_verication_otp_filed_widget.dart';

class LoginVerificationScreen extends StatefulWidget {
  const LoginVerificationScreen({super.key});

  @override
  State<LoginVerificationScreen> createState() =>
      _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  final GlobalKey<LoginVerificationTimerWidgetState> _timerKey =
      GlobalKey<LoginVerificationTimerWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          //login header
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarWidget(title: AppStrings.verifications(context: context)),

              //Login body
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w16,
                  vertical: AppHeight.h32,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.w16,
                        vertical: AppHeight.h24,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsManager.lightGreyColor),
                        borderRadius: BorderRadius.circular(AppRadius.r12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            AppStrings.enterTheVerificationCodeSentTo(),
                            style: TextStyles.font16Regular,
                            maxLines: 1,
                          ),
                          AppSpace.vertical(AppHeight.h3),
                          Text(
                            "01001908199",
                            style: TextStyles.font16Regular.copyWith(
                              color: ColorsManager.mainColor,
                            ),
                          ),
                          AppSpace.vertical(AppHeight.h16),
                          LoginVerificationOtpFiledWidget(),
                          // AppSpace.vertical(AppHeight.h12),
                          // AppButton(
                          //   title: AppStrings.continues(context: context),
                          //   onTap: () {
                          //     AppNavigator.pushNamed(
                          //       context,
                          //       AppRoutes.setUpProfileRoute,
                          //     );
                          //   },
                          // ),
                          AppSpace.vertical(AppHeight.h16),
                          Center(
                            child: LoginVerificationTimerWidget(key: _timerKey),
                          ),

                          AppSpace.vertical(AppHeight.h3),
                          GestureDetector(
                            onTap: () {
                              _timerKey.currentState?.resetTimer();
                            },
                            child: Center(
                              child: AutoSizeText(
                                AppStrings.resendVerificationCode(
                                  context: context,
                                ),
                                style: TextStyles.font14Regular.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorsManager.mainColor,
                                  color: ColorsManager.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
