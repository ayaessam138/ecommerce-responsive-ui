import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllCategoriesListviewItemWidget extends StatelessWidget {
  const AllCategoriesListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.pushNamed(context, AppRoutes.categoryProductRoute);
      },
      child: Container(
        padding: EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r8),
          color: ColorsManager.white,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.lightGreyColor.withOpacity(0.2), //
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                spacing: AppWidth.w12,
                children: [
                  Container(
                    height: AppHeight.fullHeight(context) * .1,
                    width: AppWidth.fullWidth(context) * .2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.mainColor,
                    ),
                    child: SvgPicture.asset("assets/images/dress-03.svg"),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Women’s",
                          style: TextStyles.font16Semi,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          "371${"items"}",
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
            Container(
              padding: EdgeInsets.all(AppPadding.p12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorsManager.lightGreyColor),
              ),
              child: Transform.rotate(
                angle: context.locale.languageCode == "en" ? math.pi : 0,
                child: SvgPicture.asset(AppImages.arrowIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
