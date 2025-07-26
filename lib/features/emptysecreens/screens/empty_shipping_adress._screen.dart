import '../../../core/helpers/app_images.dart';
import '../../../core/helpers/app_strings.dart';
import '../widgets/empty_screens_widget.dart';
import 'package:flutter/material.dart';

class EmptyShippingAdressScreen extends StatelessWidget {
  const EmptyShippingAdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.emptySippingAdress,
          title: AppStrings.shippingAddress(context: context),
          subTitle:AppStrings.shippingAddressSubTitle(context: context),
          buttonTitle: AppStrings.addAddress(context: context),
        ),
      ),
      
    );
  }
}

