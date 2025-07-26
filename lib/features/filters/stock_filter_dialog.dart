import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/app_spacing.dart';
import '../../core/helpers/app_strings.dart';
import '../../core/helpers/app_values.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../emptysecreens/widgets/empty_screen_button.dart';

void showBottomSheetStockFilter(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r20)),
    ),
    backgroundColor: ColorsManager.white,
    isScrollControlled: true,
    builder: (context) {
      bool isInStock = true; // true = Available, false = Not available

      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        AppStrings.stock(context: context),
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

                // Switch item
                Padding(
                  padding: EdgeInsets.all(AppPadding.p12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(

                             AppStrings.availableStock(context: context),

                        style: TextStyles.font16Semi,
                        maxLines: 1,
                      ),
                      Switch(
                        value: isInStock,
                        activeColor: ColorsManager.mainColor,
                        onChanged: (bool value) {
                          setState(() {
                            isInStock = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: AppHeight.h1,
                  color: ColorsManager.lightGreyColor,
                ),

                // Apply Button
                AppButton(
                  title: AppStrings.applyNow(context: context),
                  onTap: () {
                    // ⬇️ هنا تقدر تستخدم قيمة isInStock
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// void showBottomSheetStockFilter(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r20)),
//     ),
//     backgroundColor: ColorsManager.white,
//     isScrollControlled: true,
//     builder: (context) {
//       final List<String> stockList = [
//         AppStrings.availableStock(context: context),
//         AppStrings.notAvailableStock(context: context),
//       ];
//       final List<bool> selectedStock = List.generate(
//         stockList.length,
//         (index) => false,
//       );
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return Padding(
//             padding: EdgeInsets.all(AppPadding.p12),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: AutoSizeText(
//                         AppStrings.stock(context: context),
//                         style: TextStyles.font18Bold,
//                         maxLines: 1,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Icon(Icons.close),
//                     ),
//                   ],
//                 ),
//                 AppSpace.vertical(AppHeight.h16),
//                 ...List.generate(stockList.length, (index) {
//                   return Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(AppPadding.p12),
//                         child: Row(
//                           children: [
//                             Checkbox(
//                               activeColor: ColorsManager.mainColor,
//                               checkColor:ColorsManager.white ,
//                               value: selectedStock[index],
//                               onChanged: (bool? newValue) {
//                                 setState(() {
//                                   selectedStock[index] = newValue ?? false;
//                                 });
//                               },
//                             ),
//                             Flexible(
//                               child: AutoSizeText(
//                                 stockList[index],
//                                 style: TextStyles.font16Semi,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         height: AppHeight.h1,
//                         color: ColorsManager.lightGreyColor,
//                       ),
//                     ],
//                   );
//                 }),
//                 AppButton(
//                   title: AppStrings.applyNow(context: context),
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
