import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptyLoylatyCardscreen extends StatelessWidget {
  const EmptyLoylatyCardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptyLoayaltyCard,
          title: AppStrings.noLoyaltyCard(context: context),
          subTitle:AppStrings.noLoyaltyCardSubTitlte(context: context),
          buttonTitle: AppStrings.backTomHome(context: context),
        ),
      ),
      
    );
  }
}

