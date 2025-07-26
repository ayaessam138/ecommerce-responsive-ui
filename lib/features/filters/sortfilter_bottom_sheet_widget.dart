import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/features/filters/filter_options_widget.dart';
import 'package:client/features/filters/sort_options_widget.dart';

import 'package:flutter/material.dart';

import '../../core/helpers/app_values.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../emptysecreens/widgets/empty_screen_button.dart';

void showBottomSheetCategorySortFilter(BuildContext context, int initialIndex) {
  int selectedIndex = initialIndex;

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
            padding: EdgeInsets.all(AppPadding.p16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      AppStrings.filter(context: context),
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
                AppSpace.vertical(AppHeight.h16),
                Row(
                  children: List.generate(2, (index) {
                    final isSelected = selectedIndex == index;

                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p6,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                          child: Container(
                            padding: EdgeInsets.all(AppPadding.p10),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? ColorsManager.mainColor
                                      : ColorsManager.lightGreyColor,
                              borderRadius: BorderRadius.circular(AppRadius.r8),
                              border: Border.all(
                                color:
                                    isSelected
                                        ? ColorsManager.mainColor
                                        : Colors.transparent,
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                index == 0
                                    ? AppStrings.sort(context: context)
                                    : AppStrings.filter(context: context),
                                maxLines: 1,
                                style: TextStyles.font12Medium.copyWith(
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: AppHeight.h16),
                selectedIndex == 0
                    ? CategoriesSortOptionWidget()
                    : CategoriesFilterOptionsWidget(),
                selectedIndex == 0
                    ? AppButton(
                      title: AppStrings.applyNow(context: context),
                      onTap: () {},
                    )
                    : SizedBox.shrink(),
              ],
            ),
          );
        },
      );
    },
  );
}
