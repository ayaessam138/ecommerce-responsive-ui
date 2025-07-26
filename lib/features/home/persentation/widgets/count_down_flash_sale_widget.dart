import 'package:flutter/material.dart';

import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CountDownFlashSaleWidget extends StatelessWidget {
  const CountDownFlashSaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppHeight.h12,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CountDownFlashSaleItemWidget(),
        Text(":", style: TextStyle(color: ColorsManager.white)),
        CountDownFlashSaleItemWidget(),
        Text(":", style: TextStyle(color: ColorsManager.white)),
        CountDownFlashSaleItemWidget(),

      ],
    );
  }
}

class CountDownFlashSaleItemWidget extends StatelessWidget {
  const CountDownFlashSaleItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
        color: ColorsManager.black.withOpacity(0.24),
        borderRadius: BorderRadius.circular(AppRadius.r8),
        border: Border.all(color: ColorsManager.white),
      ),
      child: Text(
        "78",
        style: TextStyles.font16Medium.copyWith(
          color: ColorsManager.white,
        ),
      ),
    );
  }
}