
import 'package:flutter/material.dart';

import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emprtCart,
          title: AppStrings.emptyCart(context: context),
          subTitle:AppStrings.emptyCartSubTile(context: context),
          buttonTitle: AppStrings.shopNow(context: context),
        ),
      ),
      
    );
  }
}
