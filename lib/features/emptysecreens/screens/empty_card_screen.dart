
import 'package:flutter/material.dart';

import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';

class EmptyCardScreen extends StatelessWidget {
  const EmptyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptycards,
          title: AppStrings.noCardSave(context: context),
          subTitle:AppStrings.noCardSaveSubTitle(context: context ),
          buttonTitle: AppStrings.addCard(context:  context),
        ),
      ),
      
    );
  }
}

