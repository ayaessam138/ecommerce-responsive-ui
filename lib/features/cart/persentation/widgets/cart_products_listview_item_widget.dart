import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartProductsListviewItemWidget extends StatelessWidget {
  const CartProductsListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ColorsManager.lightGreyColor)),
      ),
      child: Row(
        spacing: AppWidth.w12,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(AppPadding.p8),
              height: AppHeight.fullHeight(context) * .16,
              decoration: BoxDecoration(
                color: ColorsManager.lightGreyColor,
                borderRadius: BorderRadius.circular(AppRadius.r8),
              ),
              child: SvgPicture.asset(AppImages.cartIcon, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppHeight.h6,
              children: [
                AutoSizeText(
                  "HP ProDesk 400G2 Mini-Pc | i5 Processor, 4GB RAM, 128 GB SSD, WIFI",
                  style: TextStyles.font14Bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  "XXL",
                  style: TextStyles.font14Regular.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                ),
                Row(
                  spacing: AppWidth.w6,
                  children: [
                    AutoSizeText(
                      "\$20",
                      style: TextStyles.font14Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      "\$28",
                      style: TextStyles.font14Regular.copyWith(
                        color: ColorsManager.greyColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ],
                ),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.w12,
                        vertical: AppHeight.h6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        border: Border.all(color: ColorsManager.greyColor),
                      ),
                      child: Row(
                        spacing: AppWidth.w12,
                        mainAxisSize: MainAxisSize.min,
                         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppImages.decrementIcon),
                          Flexible(child: AutoSizeText("1122", style: TextStyles.font16Semi,  maxLines: 2,)),
                          SvgPicture.asset(AppImages.incrementIcon,color: ColorsManager.mainColor,),
                        ],
                      ),
                    ),
                    Flexible(flex:3,child: SvgPicture.asset(AppImages.deleteIcon)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
