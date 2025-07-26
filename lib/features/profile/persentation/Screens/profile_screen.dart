import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/features/profile/persentation/widgets/profile/delete_ccount_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/profile/logout_bottom_sheet_widget.dart';
import '../widgets/profile/profile_header_widget.dart';
import '../widgets/profile/profile_options_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              ProfileHeaderWidget(),
              AppSpace.vertical(AppHeight.h10),
              ProfileOptionsWidget(
                imagePath: AppImages.userIcon,
                optionName: AppStrings.myProfile(context: context),
                imageColor: ColorsManager.black,
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.editProfileRoute);
                },
              ),

              ProfileOptionsWidget(
                imagePath: AppImages.addressIcon,
                optionName: AppStrings.manageAddress(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.addressRoute);
                },
              ),

              // ProfileOptionsWidget(
              //   imagePath: AppImages.couponIcon,
              //   optionName: AppStrings.coupons(context: context),
              //   onTap: () {
              //     AppNavigator.pushNamed(context, AppRoutes.couponsRoute);
              //   },
              // ),
              ProfileOptionsWidget(
                imagePath: AppImages.walletIcon,
                optionName: AppStrings.wallet(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.walletRoute);
                },
              ),
              ProfileOptionsWidget(
                imagePath: AppImages.settingsIcon,
                optionName: AppStrings.settings(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.settingsRoute);
                },
              ),
              ProfileOptionsWidget(
                imagePath: AppImages.logOutIcon,
                optionName: AppStrings.logout(context: context),
                onTap: () {
                  showBottomSheetLogout(context);
                },
              ),
              ProfileOptionsWidget(
                showDivider: false,
                imagePath: AppImages.deleteIcon,
                optionName: AppStrings.deleteAccount(context: context),
                onTap: () {
                  showBottomSheetDeleteAccount(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
