
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

class SetupPasswordScreen extends StatefulWidget {
  const SetupPasswordScreen({super.key});

  @override
  State<SetupPasswordScreen> createState() => _SetupPasswordScreenState();
}

class _SetupPasswordScreenState extends State<SetupPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  @override
  void dispose() {
    passwordController.dispose();
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
                title: AppStrings.password(context: context),
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
                          AppImages.passsword,
                          height: AppHeight.fullHeight(context) * .25,
                        ),
                      ),
                    ),

                    AppSpace.vertical(AppHeight.h20),
                    Form(
                      key: _formKey,
                      child: AppTextField(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                            showPassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        obscureText: showPassword,
                        controller: passwordController,
                        validator: (val) {
                          return AppHeleperFunctions.isFieldEmpty(value: val);
                        },
                        labelText: AppStrings.password(context: context),
                      ),
                    ),

                    AppSpace.vertical(AppHeight.h24),

                    AppButton(
                      title: AppStrings.confirm(context: context),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          AppNavigator.pushNamed(
                            context,
                            AppRoutes.setUpProfileRoute,
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
      ),
    );
  }
}
