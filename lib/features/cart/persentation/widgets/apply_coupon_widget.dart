import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ApplyCouponWidget extends StatelessWidget {
  const ApplyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.haveACoupon(context: context),
          style: TextStyles.font14Semi.copyWith(
            color: ColorsManager.mainColor,
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.mainColor,
          ),
        ),
        AppSpace.vertical(AppHeight.h16),
        Row(
          spacing: AppWidth.w12,
          children: [
            Expanded(
              flex: 9,
              child: AppTextField(
                validator: (val) {},
                hintText: AppStrings.couponCode(context: context),
                hintStyle: TextStyles.font16Regular.copyWith(
                  color: ColorsManager.greyColor,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: AppButton(
                height: 50.h,
                title: AppStrings.applyCoupon(context: context),
                onTap: () {},
              ),
            ),
          ],
        ),
        AppSpace.vertical(AppHeight.h16),
        DottedBorder(
          options: RectDottedBorderOptions(
            color: ColorsManager.mainColor,
            strokeWidth: 1,
            dashPattern: [9, 3], // 6 طول الشرطة، 3 المسافة
          ),
          child: Container(
            padding: EdgeInsets.all(AppPadding.p10),
            child: Row(
              spacing: AppWidth.w12,
              children: [
                Container(
                  padding: EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    color: ColorsManager.mainColor.withOpacity(0.2),
                    border: Border.all(color: ColorsManager.mainColor),
                  ),
                  child: SvgPicture.asset(AppImages.dollarIcon),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      AppStrings.congratulations(context: context),
                      style: TextStyles.font14Bold,
                    ),
                    AutoSizeText(
                      "You're saving \$20 on your order!",
                      style: TextStyles.font12Regular.copyWith(
                        color: ColorsManager.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        AppSpace.vertical(AppHeight.h16),
      ],
    );
  }
}