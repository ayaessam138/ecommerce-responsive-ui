import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class TransactionListviewItemWidget extends StatelessWidget {
  const TransactionListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreyColor),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w16,
              vertical: AppHeight.h12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AutoSizeText(
                    "Order ID: 65555",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font14Regular.copyWith(
                      color: ColorsManager.greyColor,
                    ),
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "20 July, 2027, 5:30 PM",
                    style: TextStyles.font14Regular.copyWith(
                      color: ColorsManager.greyColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w16,
              vertical: AppHeight.h12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Cashback",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font16Medium,
                      ),
                      AutoSizeText(
                        "Txn ID",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font14Regular.copyWith(
                          color: ColorsManager.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "+ \$20",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font16Medium,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "65555",
                        style: TextStyles.font14Regular.copyWith(
                          color: ColorsManager.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
