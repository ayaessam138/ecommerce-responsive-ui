import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptyOrderHistory extends StatelessWidget {
  const EmptyOrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.product,
          title: AppStrings.orderHistory(context: context),
          subTitle:AppStrings.orderHistorySubTitle(context: context),
          buttonTitle: AppStrings.shopNow(context: context),
        ),
      ),
      
    );
  }
}

