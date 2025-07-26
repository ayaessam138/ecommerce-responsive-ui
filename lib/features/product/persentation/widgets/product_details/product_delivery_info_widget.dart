import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ProductDeliveryInfoWidget extends StatefulWidget {
  const ProductDeliveryInfoWidget({super.key});

  @override
  State<ProductDeliveryInfoWidget> createState() =>
      _ProductDeliveryInfoWidgetState();
}

class _ProductDeliveryInfoWidgetState extends State<ProductDeliveryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.moreLightGreyColor,
          borderRadius: BorderRadius.circular(AppRadius.r8),
          border: Border.all(color: ColorsManager.white),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),

            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            shape: const Border(),
            childrenPadding: EdgeInsets.zero,
            trailing: Transform.rotate(
              angle: (context.locale.languageCode == "en" ? math.pi : 0),
              child: SvgPicture.asset(
                AppImages.arrowIcon,
                color: ColorsManager.black,
              ),
            ),
            title: AutoSizeText(
              AppStrings.deliveryInfo(context: context),
              style: TextStyles.font14Bold.copyWith(color: ColorsManager.black),
            ),

            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.p12),
                decoration: BoxDecoration(color: ColorsManager.white),
                child: Row(
                  spacing: AppHeight.h12,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppPadding.p12),
                        decoration: BoxDecoration(
                          color: ColorsManager.moreLightGreyColor,
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                        ),
                        child: Column(
                          spacing: AppHeight.h6,
                          children: [
                            SvgPicture.asset(AppImages.productDeliveryTimeIcon),
                            AutoSizeText(
                              "72 hours",
                              style: TextStyles.font14Bold,
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              AppStrings.replacement(context: context),
                              style: TextStyles.font12Regular.copyWith(
                                color: ColorsManager.greyColor,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppPadding.p12),
                        decoration: BoxDecoration(
                          color: ColorsManager.moreLightGreyColor,
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                        ),
                        child: Column(
                          spacing: AppHeight.h6,
                          children: [
                            SvgPicture.asset(AppImages.productDeliveryIcon),
                            AutoSizeText(
                              AppStrings.fast(context:context),
                              style: TextStyles.font14Bold,
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              AppStrings.delivery(context: context),
                              style: TextStyles.font12Regular.copyWith(
                                color: ColorsManager.greyColor,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppPadding.p12),
                        decoration: BoxDecoration(
                          color: ColorsManager.moreLightGreyColor,
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                        ),
                        child: Column(
                          spacing: AppHeight.h6,
                          children: [
                            SvgPicture.asset(AppImages.productSupportIcon),
                            AutoSizeText(
                              "24/7",
                              style: TextStyles.font14Bold,
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              AppStrings.support(context: context),
                              style: TextStyles.font12Regular.copyWith(
                                color: ColorsManager.greyColor,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
