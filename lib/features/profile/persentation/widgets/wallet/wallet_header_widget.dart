import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../emptysecreens/widgets/empty_screen_button.dart';

class WalletHeaderWidget extends StatelessWidget {
  const WalletHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.lightGreyColor,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w16,
              vertical: AppHeight.h24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppHeight.h6,
                  children: [
                    Text(
                      AppStrings.fullName(context: context),
                      style: TextStyles.font16Regular.copyWith(
                        color: ColorsManager.greyColor,
                      ),
                    ),
                    Text("ALEXA SMITH", style: TextStyles.font16Bold),
                  ],
                ),
                AppButton(
                  buttonTextcolor: ColorsManager.black,
                  title: AppStrings.withDraw(context: context),
                  onTap: () {},
                  buttoncolor: ColorsManager.yellow,
                  width: AppWidth.fullWidth(context) * .2,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              color: ColorsManager.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppRadius.r12),
                bottomRight: Radius.circular(AppRadius.r12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppPadding.p10),
                  child: AutoSizeText(
                    AppStrings.balance(context: context),
                    style: TextStyles.font16Bold.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                ),
                AutoSizeText(
                  "29",
                  style: TextStyles.font16Bold.copyWith(
                    color: ColorsManager.white,
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
