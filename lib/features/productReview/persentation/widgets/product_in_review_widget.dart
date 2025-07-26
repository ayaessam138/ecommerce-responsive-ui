import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProductInReviewWidget extends StatelessWidget {
  const ProductInReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppWidth.fullWidth(context),
          height: AppHeight.fullHeight(context)*.15,
          // color: ColorsManager.redColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: ColorsManager.lightGreyColor)
          ),
          child: Image.asset(AppImages.product,fit: BoxFit.contain,),
        ),
        AutoSizeText(
          "Men’s WatchMen’s",
          style: TextStyles.font14Bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        AutoSizeText(
          "X FashionX Fashion",
          style: TextStyles.font14Regular.copyWith(
            color: ColorsManager.greyColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    );
  }
}
