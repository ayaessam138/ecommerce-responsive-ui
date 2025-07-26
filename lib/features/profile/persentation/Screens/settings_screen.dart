import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/appbar_widget.dart';
import '../widgets/profile/profile_options_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidget(title: AppStrings.settings(context: context)),
              AppSpace.vertical(AppHeight.h16),
              ProfileOptionsWidget(
                imagePath: AppImages.languageIcon,
                imageColor: ColorsManager.black,
                optionName: AppStrings.language(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.languageRoute);
                },
              ),

              ProfileOptionsWidget(
                imagePath: AppImages.noticationIcon,
                optionName: AppStrings.notifications(context: context),
                onTap: () {
                  AppNavigator.pushNamed(
                    context,
                    AppRoutes.receiveNotificationsScreenRoute,
                  );
                },
              ),
              ProfileOptionsWidget(
                imagePath: AppImages.faceIdIcon,
                optionName: AppStrings.faceId(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.faceIdRoute);
                },
              ),
              ProfileOptionsWidget(
                imagePath: AppImages.privacyPolicyIcon,
                optionName: AppStrings.privacyPolicy(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.privacyPolicyRoute);
                },
              ),
              ProfileOptionsWidget(
                imagePath: AppImages.returnPolicyIcon,
                optionName: AppStrings.returnPolicy(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.returnPolicyRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
