
import 'package:flutter/material.dart';
import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
class EmptyCouponScreen extends StatelessWidget {
  const EmptyCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptycoupn,
          title: AppStrings.noCouponsYet(context: context),
          subTitle:AppStrings.noCouponsYetSubTitle(context: context),
          buttonTitle: AppStrings.backTomHome(context: context),
        ),
      ),
      
    );
  }
}

