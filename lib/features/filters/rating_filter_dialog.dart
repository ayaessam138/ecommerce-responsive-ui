import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/widgets/product._rating.dart';

import 'package:flutter/material.dart';

import '../../core/helpers/app_strings.dart';
import '../../core/helpers/app_values.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../emptysecreens/widgets/empty_screen_button.dart';

void showBottomSheetRatingFilter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r20)),
    ),
    backgroundColor: ColorsManager.white,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Column(
              spacing: AppHeight.h16,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        AppStrings.rating(context: context),
                        style: TextStyles.font18Bold,
                        maxLines: 1,

                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),

                ProductRating(),
                AppButton(
                  title: AppStrings.applyNow(context: context),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
