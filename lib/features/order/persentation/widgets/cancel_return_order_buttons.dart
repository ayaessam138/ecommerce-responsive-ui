import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:client/features/order/persentation/widgets/cancel_order_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CancelReturnOrderButtons extends StatelessWidget {
  const CancelReturnOrderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Row(
        spacing: AppWidth.w12,
        children: [
          Expanded(
            child: AppButton(
              title: AppStrings.cancelOrder(context: context),
              onTap: () {
                showBottomSheetCancelOrder(context);
              },
            ),
          ),
          // Expanded(
          //   child: AppButton(
          //     title: AppStrings.returnOrder(context: context),
          //     onTap: () {
          //       showBottomSheetReturnOrder(context);
          //     },
          //     buttoncolor: ColorsManager.yellow,
          //   ),
          // ),
        ],
      ),
    );
  }
}
