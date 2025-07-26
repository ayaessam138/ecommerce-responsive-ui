
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../order/persentation/widgets/order_summary_item_widget.dart';



class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummaryItemWidget(
          title: AppStrings.subtotal(context: context),
          subTitle: '\$120.00',
        ),
        AppSpace.vertical(AppHeight.h8),
        OrderSummaryItemWidget(
          title: AppStrings.discountApplied(context: context),
          subTitle: '\$120.00',
          subTitleStyle: TextStyles.font14Regular.copyWith(
            color: ColorsManager.redColor,
          ),
        ),
        AppSpace.vertical(AppHeight.h10),
        Divider(height: AppHeight.h1),
        AppSpace.vertical(AppHeight.h10),

        OrderSummaryItemWidget(
          title: AppStrings.amountPayPal(context: context),
          subTitle: '\$120.00',
          subTitleStyle: TextStyles.font16Semi,
          titleStyle: TextStyles.font16Semi,
        ),
      ],
    );
  }
}

