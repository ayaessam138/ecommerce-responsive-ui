import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.noInternetConnection,
          title: AppStrings.noInternetonCnection(context: context),
          subTitle:AppStrings.noInternetonCnectionSubtile(context: context),
          buttonTitle: AppStrings.enableWifi(context:context  ),
        ),
      ),
      
    );
  }
}
