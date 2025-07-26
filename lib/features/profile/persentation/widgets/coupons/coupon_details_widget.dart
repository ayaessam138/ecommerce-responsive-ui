import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/styles.dart';

class CouponDeatailsWidget extends StatelessWidget {
  const CouponDeatailsWidget({super.key, required this.couponDeatails});
  final String couponDeatails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppWidth.w16,
        vertical: AppHeight.h6,
      ),
      child: Row(
        spacing: AppWidth.w4,
        children: [
          AutoSizeText('•', style: TextStyle(fontSize: AppFontSize.f20)),
          AutoSizeText(couponDeatails, style: TextStyles.font14Regular),
        ],
      ),
    );
  }
}
