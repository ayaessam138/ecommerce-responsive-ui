import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/theming/styles.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreyColor),
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: AutoSizeText(
              AppStrings.paymentMethod(context: context),
              style: TextStyles.font16Semi,
            ),
          ),
          Divider(height: AppHeight.h1),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Column(
              spacing: AppHeight.h16,
              children: [
                PaymentOption(
                  paymentOptionName: AppStrings.cash(context: context),
                  onTap: () {},
                ),
                PaymentOption(
                  paymentOptionName: AppStrings.visa(context: context),
                  onTap: () {},
                ),
                PaymentOption(
                  paymentOptionName: AppStrings.payPal(context: context),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String paymentOptionName;
  final void Function() onTap;

  const PaymentOption({
    super.key,
    required this.paymentOptionName,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.lightGreyColor),
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: AppWidth.w16,
              children: [
                SvgPicture.asset(AppImages.paymentMethodIcon),
                AutoSizeText(
                  paymentOptionName,
                  style: TextStyles.font16Regular,
                ),
              ],
            ),
            Transform.rotate(
              angle: context.locale.languageCode == "en" ? math.pi : 0,

              child: SvgPicture.asset(AppImages.arrowIcon),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//   padding: EdgeInsets.all(AppPadding.p8),
//   decoration: BoxDecoration(
//     color: ColorsManager.lightGreyColor,
//     border: Border.all(color: ColorsManager.lightGreyColor),
//     borderRadius: BorderRadius.only(
//       topRight: Radius.circular(AppRadius.r8),
//       topLeft: Radius.circular(AppRadius.r8),
//     ),
//   ),
//   child: Row(
//     spacing: AppWidth.w8,
//     children: [
//       SvgPicture.asset(AppImages.dollarIcon),
//       AutoSizeText(
//         AppStrings.paymentMethod(context: context),
//         style: TextStyles.font16Semi,
//       ),
//     ],
//   ),
// ),
