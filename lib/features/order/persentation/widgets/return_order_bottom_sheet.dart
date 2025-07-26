import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/check_listtile_widget.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';

void showBottomSheetReturnOrder(BuildContext context) {
  final reasons = [
    'Found a better price elsewhere.',
    'Item arrived too late.',
    'Ordered by mistake.',
    'Product no longer needed.',
    'Wrong item was sent.',
  ];

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
          final List<bool> selected = List.generate(reasons.length, (_) => false);

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.orderReturnAndRefund(context: context),
                        style: TextStyles.font18Bold,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),
                ...List.generate(reasons.length, (index) {
                  return Column(
                    children: [
                      CheckboxItem(
                        title: reasons[index],
                        value: selected[index],
                        onChanged: (bool? val) {
                          setState(() {
                            selected[index] = val ?? false;
                          });
                        },
                      ),
                      Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),

                    ],
                  );
                }),
                Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),
                Padding(
                  padding:  EdgeInsets.all(AppPadding.p16),
                  child: AppButton(
                    title: AppStrings.confirm(context: context),
                    onTap: () {
                      showBottomSheetReturnOrder(context);
                    },
                    buttoncolor: ColorsManager.yellow,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}



