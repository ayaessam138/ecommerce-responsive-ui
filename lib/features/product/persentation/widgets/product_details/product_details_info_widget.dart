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

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({super.key});

  @override
  State<ProductInfoWidget> createState() =>
      _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.r8),
      child: Container(
        decoration: BoxDecoration(
          color:
              _isExpanded
                  ? ColorsManager.mainColor.withOpacity(0.3)
                  : ColorsManager.moreLightGreyColor,
          borderRadius: BorderRadius.circular(AppRadius.r8),
          border: Border.all(color: ColorsManager.white),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            initiallyExpanded: _isExpanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _isExpanded = expanded;
              });
            },
            backgroundColor: Colors.transparent,
            collapsedBackgroundColor: Colors.transparent,
            shape: const Border(),
            childrenPadding: EdgeInsets.zero,
            trailing: Transform.rotate(
              angle: (context.locale.languageCode == "en" ? math.pi : 0),
              child: SvgPicture.asset(
                AppImages.arrowIcon,
                color:
                    _isExpanded ? ColorsManager.mainColor : ColorsManager.black,
              ),
            ),
            title: AutoSizeText(
              AppStrings.info(context: context),
              style: TextStyles.font14Bold.copyWith(
                color:
                    _isExpanded ? ColorsManager.mainColor : ColorsManager.black,
              ),
            ),

            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.p12),
                decoration: BoxDecoration(color: ColorsManager.white),
                child: Column(
                  spacing: AppHeight.h12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            AppStrings.shelfLife(context: context),
                            style: TextStyles.font14Regular,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            "subTitle",
                            style: TextStyles.font14Regular.copyWith(
                              color: ColorsManager.greyColor,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            AppStrings.returnPolicy(context: context),
                            style: TextStyles.font14Regular,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            "subTitle",
                            style: TextStyles.font14Regular.copyWith(
                              color: ColorsManager.greyColor,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            AppStrings.packingType(context: context),
                            style: TextStyles.font14Regular,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            "subTitle",
                            style: TextStyles.font14Regular.copyWith(
                              color: ColorsManager.greyColor,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            AppStrings.unit(context: context),
                            style: TextStyles.font14Regular,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            "subTitle",
                            style: TextStyles.font14Regular.copyWith(
                              color: ColorsManager.greyColor,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            AppStrings.madeBy(context: context),
                            style: TextStyles.font14Regular,
                            maxLines: 1,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            "subTitle",
                            style: TextStyles.font14Regular.copyWith(
                              color: ColorsManager.greyColor,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
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
