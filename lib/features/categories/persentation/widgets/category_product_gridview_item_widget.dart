import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CategoryProductGridviewItemWidget extends StatelessWidget {
  const CategoryProductGridviewItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.r12),
            child: Stack(
              children: [
                Image.asset(
                  AppImages.product,
                  width: AppWidth.fullWidth(context) * .5,
                ),
                Positioned(
                  top: AppHeight.h12,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppWidth.w8,
                      vertical: AppHeight.h4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsManager.redColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppRadius.r4),
                        bottomRight: Radius.circular(AppRadius.r4),
                      ),
                    ),
                    child: Text(
                      AppStrings.sale(context: context),
                      style: TextStyles.font10Bold.copyWith(
                        color: ColorsManager.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        AutoSizeText(
          "Men’s Watch ",
          style: TextStyles.font14Bold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        AutoSizeText(
          "X Fashion",
          style: TextStyles.font12Regular.copyWith(
            color: ColorsManager.greyColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          spacing: AppWidth.w8,
          children: [
            AutoSizeText(
              "\$28.56", // current price
              style: TextStyles.font14Semi,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            AutoSizeText(
              "\$45.00", // original price before sale
              style: TextStyles.font12Regular.copyWith(
                color: ColorsManager.greyColor,
                decoration: TextDecoration.lineThrough,
                decorationColor: ColorsManager.greyColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          spacing: AppWidth.w12,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w12,
                  vertical: AppHeight.h10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                  border: Border.all(color: ColorsManager.greyColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppImages.decrementIcon),
                    AutoSizeText("1", style: TextStyles.font16Semi),
                    SvgPicture.asset(AppImages.incrementIcon,color:  ColorsManager.mainColor,),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w12,
                  vertical: AppHeight.h10,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.mainColor,
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: SvgPicture.asset(
                  AppImages.cartIcon,
                  color: ColorsManager.white,
                  // height: AppHeight.h40,
                  width: AppWidth.w20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
