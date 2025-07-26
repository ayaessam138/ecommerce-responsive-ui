import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationListviewItemWidget extends StatelessWidget {
  const NotificationListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r8),
        border: Border.all(color: ColorsManager.lightGreyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppWidth.w16,
        children: [
          Expanded(
            child: Row(
              spacing: AppWidth.w16,
              children: [
                SvgPicture.asset(AppImages.noticationIcon),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Received Order",
                        style: TextStyles.font16Semi,
                      ),
                      AutoSizeText(
                        "Thank you! Your order #546567 has been placed successfully.",
                        maxLines: 2,
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
          GestureDetector(child: Icon(Icons.close)),
        ],
      ),
    );
  }
}
