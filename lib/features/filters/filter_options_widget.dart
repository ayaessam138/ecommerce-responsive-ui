import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/features/filters/price_filter_dialog.dart';
import 'package:client/features/filters/size_filter_dialog.dart';
import 'package:client/features/filters/stock_filter_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_filter_dialog.dart';

class CategoriesFilterOptionsWidget extends StatefulWidget {
  const CategoriesFilterOptionsWidget({super.key});

  @override
  State<CategoriesFilterOptionsWidget> createState() =>
      _CategoriesFilterOptionsWidgetState();
}

class _CategoriesFilterOptionsWidgetState
    extends State<CategoriesFilterOptionsWidget> {
  late List<String> filtersNames;
  late List<String> imagesPaths;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    filtersNames = [
      AppStrings.color(context: context),
      AppStrings.size(context: context),
      AppStrings.price(context: context),
      // AppStrings.rating(context: context),
      AppStrings.stock(context: context),
    ];
    imagesPaths = [
      AppImages.colorsIcon,
      AppImages.sizeIcon,
      AppImages.priceIcon,
      // AppImages.ratingIcon,
      AppImages.stockIcon,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(filtersNames.length, (index) {
        return CategoriesFilterOptionsItemWidget(
          imagePath: imagesPaths[index],
          filterName: filtersNames[index],
          onTap: () {
            if (index == 0) {
              // فقط لما يضغط على "color"
              showBottomSheetColorFilter(context);
            }
            if (index == 1) {
              // فقط لما يضغط على "size"
              showBottomSheetSizeFilter(context);
            }
            if (index == 2) {
              // فقط لما يضغط على "price"
              showBottomSheetPriceFilter(context);
            }
            // if (index == 3) {
            //   // فقط لما يضغط على "rating"
            //   showBottomSheetRatingFilter(context);
            // }
            if (index == 3) {
              // فقط لما يضغط على "stock"
              showBottomSheetStockFilter(context);
            }
          },
        );
      }),
    );
  }
}

class CategoriesFilterOptionsItemWidget extends StatelessWidget {
  final String imagePath;
  final String filterName;
  final void Function() onTap;

  const CategoriesFilterOptionsItemWidget({
    super.key,
    required this.imagePath,
    required this.filterName,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  spacing: AppWidth.w6,
                  children: [
                    SvgPicture.asset(imagePath),
                    Flexible(
                      child: AutoSizeText(
                        filterName,
                        style: TextStyles.font16Semi,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: context.locale.languageCode == "en" ? math.pi : 0,
                child: SvgPicture.asset(AppImages.arrowIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
