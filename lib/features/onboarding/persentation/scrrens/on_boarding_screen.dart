import 'package:client/core/helpers/app_images.dart';
import 'package:client/features/onboarding/persentation/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  int index = 0;
  PageController controller = PageController();
  void goToNextPage() {
    if (index < 2) {
      controller.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    }
    if (index == 2) {
      // // AppHiveLocalStorage.saveBool(
      // //   AppSavedKey.onBorading,
      // //   true,
      // //   Hive.box(AppSavedKey.intialRoute),
      // // );
      AppNavigator.go(context, AppRoutes.loginRoute);
    }
  }

  void skipOnBoarding() {
    // AppNavigator.go(context, AppRoutes.loginScreen);
    // AppHiveLocalStorage.saveBool(
    //   AppSavedKey.onBorading,
    //   true,
    //   Hive.box(AppSavedKey.intialRoute),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSpace.vertical(AppHeight.h24),
          Expanded(
            flex: 3,
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: controller,
              children: [
                OnBoardingPageContent(
                  imagePath: AppImages.firstonboardingScreen,
                  firstLabel: "Fast & Reliable Delivery",
                  secondLabel:
                      "Express Delivery made easy! Your orders will be shipped swiftly and reach you in no time.",
                  index: index,
                  onPressedNext: goToNextPage,
                ),
                OnBoardingPageContent(
                  imagePath: AppImages.secondonboardingScreen,
                  firstLabel: "Shop Anytime, Anywhere",
                  secondLabel:
                      "Experience seamless shopping 24/7, wherever you are. Your favorite products are just a tap away!",
                  index: index,
                  onPressedNext: goToNextPage,
                ),
                OnBoardingPageContent(
                  imagePath:AppImages.thirdonboardingScreen,
                  firstLabel: "Exclusive Deals Await",
                  secondLabel:
                      "Unlock daily discounts, flash sales, and member-only offers that help you save more on every purchase.",
                  index: index,
                  onPressedNext: goToNextPage,
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(AppPadding.p16),
            child: AppButton(
              title: AppStrings.next(context: context),
              onTap: goToNextPage,
            ),
          ),
        ],
      ),
    );
  }
}
