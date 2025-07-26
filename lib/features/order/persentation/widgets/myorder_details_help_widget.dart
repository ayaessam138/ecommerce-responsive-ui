import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrderDetailsHelpWidget extends StatelessWidget {
  const MyOrderDetailsHelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreyColor),
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      child: Row(
        spacing: AppWidth.w10,
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              color: ColorsManager.mainColor.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManager.mainColor),
            ),
            child: SvgPicture.asset(
              AppImages.phoneIcon,
              color: ColorsManager.black,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  AppStrings.needHelpWithAnyThing(context: context),
                  style: TextStyles.font16Regular.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                ),
                AutoSizeText("${AppStrings.call(context: context)}(239)555-0108" ,style: TextStyles.font16Semi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
