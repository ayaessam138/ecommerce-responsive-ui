import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptyReturnsScreen extends StatelessWidget {
  const EmptyReturnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.login,
          title: AppStrings.noReturnAndrefund(context: context),
          subTitle:AppStrings.noReturnAndrefundSubtitle(context: context),
          buttonTitle: AppStrings.backTomHome(context: context),
        ),
      ),
      
    );
  }
}
