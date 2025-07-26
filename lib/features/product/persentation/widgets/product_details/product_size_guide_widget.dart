import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductSizeGuideWidget extends StatelessWidget {
  const ProductSizeGuideWidget({
    super.key,
    required this.productProperty,
    required this.onTap,
  });
  final String productProperty;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: AppWidth.fullWidth(context),
        padding: EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: ColorsManager.moreLightGreyColor,
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: AutoSizeText(
                productProperty,
                style: TextStyles.font14Bold,
              ),
            ),
            Transform.rotate(
              angle: context.locale.languageCode == "en" ? math.pi : 0,
              child: SvgPicture.asset(AppImages.arrowIcon),
            ),
          ],
        ),
      ),
    );
  }
}

void showSizeGuideBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: ColorsManager.white,
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: AppHeight.h16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  AppStrings.sizeGuide(context: context),
                  style: TextStyles.font18Bold,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                ),
              ],
            ),
            AutoSizeText(
              AppStrings.internationalConversions(context:context),
              style: TextStyles.font16Semi,
            ),
            Divider(height: AppHeight.h1,),
            SizeGuideTable(),
          ],
        ),
      );
    },
  );
}

class SizeGuideTable extends StatelessWidget {
  SizeGuideTable({super.key});

  final List<String> standardsName = ["#", "UK", "USA", "EU", "Asia"];

  final List<List<String>> sizeData = [
    ["S", "6", "2", "34", "56"],
    ["M", "8", "4", "36", "58"],
    ["L", "10", "6", "38", "60"],
    ["XL", "12", "8", "40", "62"],
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: ColorsManager.lightGreyColor,
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      columnWidths: {
        0: FixedColumnWidth(80),
        1: FixedColumnWidth(60),
        2: FixedColumnWidth(60),
        3: FixedColumnWidth(60),
        4: FixedColumnWidth(60),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        // Header row
        TableRow(
          children: List.generate(standardsName.length, (index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                standardsName[index],
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          }),
        ),

        // Data rows
        ...sizeData.map((row) {
          return TableRow(
            children: List.generate(row.length, (index) {
              return Padding(
                padding: EdgeInsets.all(AppPadding.p8),
                child: Text(row[index], textAlign: TextAlign.center),
              );
            }),
          );
        }),
      ],
    );
  }
}
