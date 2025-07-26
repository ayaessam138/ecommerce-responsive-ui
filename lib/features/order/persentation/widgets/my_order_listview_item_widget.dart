import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';

class MyOrderListviewItemWidget extends StatelessWidget {
  const MyOrderListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNamed(context, AppRoutes.myOrderDetailsRoute);
      },
      child: Container(
        padding: EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.lightGreyColor),
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Order #RS23454",
                        style: TextStyles.font16Regular.copyWith(
                          color: ColorsManager.darkGreyColor,
                        ),
                      ),
                      AutoSizeText(
                        "Placed on 10 Dec, 2024",
                        style: TextStyles.font16Semi,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(AppPadding.p12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                      border: Border.all(color: ColorsManager.lightGreyColor),
                    ),
                    child: Transform.rotate(
                      angle: context.locale.languageCode == "en" ? math.pi : 0,
                      child: SvgPicture.asset(AppImages.arrowIcon),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AutoSizeText(
                    "Item x 5",
                    style: TextStyles.font14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    "Delivered",
                    style: TextStyles.font14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: AutoSizeText(
                    AppStrings.amount(context: context),
                    style: TextStyles.font14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    "\$229.49",
                    style: TextStyles.font14Regular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
