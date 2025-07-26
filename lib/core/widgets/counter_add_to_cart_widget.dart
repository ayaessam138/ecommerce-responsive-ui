import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/app_images.dart';
import '../helpers/app_values.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class CounterAddToCartWidget extends StatelessWidget {
  const CounterAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppWidth.w8,
      children: [
        // Counter Box
        Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w12,
              vertical: AppHeight.h6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r8),
              border: Border.all(color: ColorsManager.greyColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppImages.decrementIcon),
                AutoSizeText("1", style: TextStyles.font16Semi),
                SvgPicture.asset(AppImages.incrementIcon,color: ColorsManager.mainColor,),
              ],
            ),
          ),
        ),

        // Cart Icon Box
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w12,
              vertical: AppHeight.h6,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.mainColor,
              borderRadius: BorderRadius.circular(AppRadius.r8),
            ),
            child: SvgPicture.asset(
              AppImages.cartIcon,
              color: ColorsManager.white,
              width: AppWidth.w20,
            ),
          ),
        ),
      ],
    );

    // return Padding(
    //   padding: EdgeInsets.only(top: AppHeight.h8),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       // Counter Box
    //       Expanded(
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: AppWidth.w12,
    //             vertical: AppHeight.h6,
    //           ),
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(AppRadius.r8),
    //             border: Border.all(color: ColorsManager.greyColor),
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               SvgPicture.asset(AppImages.decrementIcon),
    //               AutoSizeText("1", style: TextStyles.font16Semi),
    //               SvgPicture.asset(AppImages.incrementIcon),
    //             ],
    //           ),
    //         ),
    //       ),
    //
    //       // Small space between boxes
    //       SizedBox(width: AppWidth.w8),
    //
    //       // Cart Icon Box
    //       SizedBox(
    //         width: cartWidth,
    //         child: Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: AppWidth.w12,
    //             vertical: AppHeight.h6,
    //           ),
    //           decoration: BoxDecoration(
    //             color: ColorsManager.mainColor,
    //             borderRadius: BorderRadius.circular(AppRadius.r8),
    //           ),
    //           child: SvgPicture.asset(
    //             AppImages.cartIcon,
    //             color: ColorsManager.white,
    //             width: AppWidth.w20,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
