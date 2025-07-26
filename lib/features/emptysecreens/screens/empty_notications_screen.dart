import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptyNoticationsScreen extends StatelessWidget {
  const EmptyNoticationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptyNotfications,
          title: AppStrings.noNotfications(context: context),
          subTitle:AppStrings.noNotficationsSubTitle(context: context),
          buttonTitle: AppStrings.backTomHome(context: context),
        ),
      ),
      
    );
  }
}
