import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../emptysecreens/widgets/empty_screens_widget.dart';


class SuccessOrderPaymentScreen extends StatelessWidget {
  const SuccessOrderPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EmptyScreensWidget(
          imagePath: AppImages.successOrderPayment,
          title: AppStrings.successfully(context: context),
          subTitle:"Your Order Has Been Successfully Submitted for cancelled requests ! Order ID: 854455 – Our team will get back to you shortly!",
          buttonTitle: AppStrings.backTomHome(context:  context),
        ),
      ),

    );
  }
}
