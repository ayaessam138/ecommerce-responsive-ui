import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart'
    show AppHeight, AppPadding, AppRadius, AppWidth;
import '../../../../core/theming/colors.dart' show ColorsManager;
import '../../../../core/theming/styles.dart';
import 'order_summary_item_widget.dart';

class MyOrderSummary extends StatelessWidget {
  const MyOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p16),
      width: AppWidth.fullWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r8),
        border: Border.all(color: ColorsManager.lightGreyColor),
      ),
      child: Column(
        spacing: AppHeight.h6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.orderSummary(context: context),
            style: TextStyles.font16Semi,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),
          OrderSummaryItemWidget(
            title: AppStrings.subtotal(context: context),
            subTitle: '\$120.00',
          ),
          OrderSummaryItemWidget(
            title: AppStrings.discountApplied(context: context),
            subTitle: '\$120.00',
            subTitleStyle: TextStyles.font14Regular.copyWith(
              color: ColorsManager.redColor,
            ),
          ),

          Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),
          OrderSummaryItemWidget(
            title: AppStrings.shippingFee(context: context),
            subTitle: '\$120.00',
          ),
          OrderSummaryItemWidget(
            title: AppStrings.estimatedVat(context: context),
            subTitle: '\$120.00',
          ),

          Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),
          OrderSummaryItemWidget(
            title: AppStrings.totalAmount(context: context),
            subTitle: '\$120.00',
            subTitleStyle: TextStyles.font16Semi,
            titleStyle: TextStyles.font16Semi,
          ),
        ],
      ),
    );
  }
}


