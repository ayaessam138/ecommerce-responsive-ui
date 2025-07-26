import 'package:client/core/helpers/app_secure_local_storage.dart';
import 'package:client/core/helpers/functions.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumber.dispose();
    super.dispose();
  }

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
              AppbarWidget(
                title: AppStrings.signIn(context: context),
                showArrow: false,
              ),

              //Login body
              Padding(
                padding: EdgeInsets.all(AppPadding.p20),
                child: Column(
                  children: [
                    AppSpace.vertical(AppHeight.h32),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsManager.mainColor),
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        child: Image.asset(
                          AppImages.login,
                          height: AppHeight.fullHeight(context) * .25,
                        ),
                      ),
                    ),

                    AppSpace.vertical(AppHeight.h20),
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
                        children: [
                          Form(
                            key: _formKey,
                            child: AppTextField(
                              controller: phoneNumber,
                              validator: (val) {
                                return AppHeleperFunctions.isFieldEmpty(
                                  value: val,
                                );
                              },
                              labelText: AppStrings.phoneNumber(
                                context: context,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),

                          AppSpace.vertical(AppHeight.h24),

                          AppButton(
                            title: AppStrings.continues(context: context),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                AppSecureLocalStorageHelperFunctions.saveUserNumber(
                                  userNumber: phoneNumber.text,
                                );
                                AppNavigator.pushNamed(
                                  context,
                                  AppRoutes.loginVerificationRoute,
                                );
                              }
                            },
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
