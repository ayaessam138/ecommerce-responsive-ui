import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptySearchScreen extends StatelessWidget {
  const EmptySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptySearch,
          title: AppStrings.noResultFound(context: context),
          subTitle:AppStrings.noSearchSubTiltle(context: context),
          buttonTitle: AppStrings.searchAgain(context: context),
        ),
      ),
      
    );
  }
}

