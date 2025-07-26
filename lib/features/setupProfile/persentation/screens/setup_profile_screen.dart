import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';

import '../../../emptysecreens/widgets/empty_screen_button.dart';
import '../widgets/setup_profile_textfileds_widget.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWidget(title: AppStrings.setUpProfile(context: context),showArrow: false,),

            //Profile body
            Expanded(child: SingleChildScrollView(child: SetupProfileTextFieldsWidget())),
            Divider(thickness: 0.2.w, color: ColorsManager.black),
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  AppButton(
                    title: AppStrings.signUp(context: context),
                    onTap: () {},
                  ),
                  AppSpace.vertical(AppHeight.h16),
                  AppButton(
                    title: AppStrings.skip(context: context),
                    onTap: () {
                      AppNavigator.pushNamed(
                        context,
                        AppRoutes.setupFaceIdRoute,
                      );
                    },
                    buttoncolor: ColorsManager.white,
                    buttonTextcolor: ColorsManager.black,
                    bordercolor: ColorsManager.lightGreyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
