import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';

void showBottomSheetProductKeyInfo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r20)),
    ),
    backgroundColor: ColorsManager.white,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppHeight.h12,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  AppStrings.productInformation(context: context),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppHeight.h12,
                  children: [
                    AutoSizeText("Fabric Materials", style: TextStyles.font16Semi),
                    Divider(height: AppHeight.h1),
                    AutoSizeText(
                      "Cotton: Soft, breathable, and durable. Great for everyday wear.\nPolyester: Lightweight, wrinkle-resistant, and moisture-wicking. Ideal for athletic t-shirts.\nBlends: Cotton-polyester blends combine comfort and durability.\nLinen: Lightweight and breathable, perfect for summer wear.\nSpandex/Elastane: Adds stretch, often blended for athletic or fitted styles.",
                    ),
                    AutoSizeText("Styles", style: TextStyles.font16Semi),
                    Divider(height: AppHeight.h1),
                    AutoSizeText(
                      "Cotton: Soft, breathable, and durable. Great for everyday wear.\nPolyester: Lightweight, wrinkle-resistant, and moisture-wicking. Ideal for athletic t-shirts.\nBlends: Cotton-polyester blends combine comfort and durability.\nLinen: Lightweight and breathable, perfect for summer wear.\nSpandex/Elastane: Adds stretch, often blended for athletic or fitted styles.",
                    ),
                    AutoSizeText("Sleeve Types", style: TextStyles.font16Semi),
                    Divider(height: AppHeight.h1),
                    AutoSizeText(
                      "Cotton: Soft, breathable, and durable. Great for everyday wear.\nPolyester: Lightweight, wrinkle-resistant, and moisture-wicking. Ideal for athletic t-shirts.\nBlends: Cotton-polyester blends combine comfort and durability.\nLinen: Lightweight and breathable, perfect for summer wear.\nSpandex/Elastane: Adds stretch, often blended for athletic or fitted styles.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
