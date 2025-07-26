import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/theming/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helpers/app_spacing.dart';
import '../../core/helpers/app_strings.dart';
import '../../core/helpers/app_values.dart';
import '../../core/theming/colors.dart';
import '../emptysecreens/widgets/empty_screen_button.dart';
//colorsDialog

// Sample color list
final List<Map<String, dynamic>> colorsData = [
  {'name': 'Red', 'color': Colors.red},
  {'name': 'Green', 'color': Colors.green},
  {'name': 'Blue', 'color': Colors.blue},
  {'name': 'Yellow', 'color': Colors.yellow},
  {'name': 'Purple', 'color': Colors.purple},
  {'name': 'Orange', 'color': Colors.orange},
];

List<bool> isChecked = List.filled(colorsData.length, false);
void showBottomSheetColorFilter(BuildContext context) {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        AppStrings.color(context: context),
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
                AppSpace.vertical(AppHeight.h16),
                ...List.generate(colorsData.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppPadding.p12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: ColorsManager.mainColor,
                                    checkColor:ColorsManager.white ,
                                    value: isChecked[index],
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isChecked[index] = newValue ?? false;
                                      });
                                    },
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      colorsData[index]['name'],
                                      style: TextStyles.font16Semi,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorsData[index]['color'],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: AppHeight.h1,
                        color: ColorsManager.lightGreyColor,
                      ),
                    ],
                  );
                }),
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





