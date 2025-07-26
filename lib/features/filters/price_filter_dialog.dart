//price dialog

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import '../../core/helpers/app_spacing.dart';
import '../../core/helpers/app_strings.dart';
import '../../core/helpers/app_values.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/widgets/range_slider_widget.dart';
import '../emptysecreens/widgets/empty_screen_button.dart';

final List<String> pricesList = ['Under \$100', '\$100-\$200', '\$200-\$300'];
int selectedPriceIndex = -1;
void showBottomSheetPriceFilter(BuildContext context) {
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
                        AppStrings.price(context: context),
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
                CustomRangeSlider(),
                ...List.generate(pricesList.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppPadding.p12),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: ColorsManager.mainColor,
                              checkColor: ColorsManager.white,
                              value: selectedPriceIndex == index,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  if (newValue == true) {
                                    selectedPriceIndex = index;
                                  } else {
                                    selectedPriceIndex = -1;
                                  }
                                });
                              },
                            ),
                            Flexible(
                              child: AutoSizeText(
                                pricesList[index],
                                style: TextStyles.font16Semi,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
