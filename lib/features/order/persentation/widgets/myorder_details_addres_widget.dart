import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class MyOrderDetailsAddressWidget extends StatelessWidget {
  const MyOrderDetailsAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreyColor),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              color: ColorsManager.moreLightGreyColor,
              border: Border.all(color: ColorsManager.lightGreyColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.r12),
                topRight: Radius.circular(AppRadius.r12),
              ),
            ),
            child: Row(
              spacing: AppWidth.w12,

              children: [
                SvgPicture.asset(AppImages.homeAddressIcon),
                Flexible(
                  child: AutoSizeText(
                    "Home Address",
                    style: TextStyles.font16Semi,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Column(
              spacing: AppHeight.h12,
              children: [
                Row(
                  spacing: AppWidth.w12,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: AppWidth.w6,
                        children: [
                          SvgPicture.asset(AppImages.userIcon),
                          Flexible(
                            child: AutoSizeText(
                              AppStrings.name(context: context),
                              style: TextStyles.font14Regular,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(":"),
                    Flexible(
                      child: AutoSizeText(
                        "Alexa SmithAlexa SmithAlexa SmithAlexa SmithAlexa Smith",
                        style: TextStyles.font14Regular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: AppWidth.w12,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: AppWidth.w6,
                        children: [
                          SvgPicture.asset(AppImages.phoneIcon),
                          Flexible(
                            child: AutoSizeText(
                              AppStrings.phone(context: context),
                              style: TextStyles.font14Regular,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(":"),
                    Flexible(
                      child: AutoSizeText(
                        "02009858848",
                        style: TextStyles.font14Regular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: AppWidth.w12,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: AppWidth.w6,
                        children: [
                          SvgPicture.asset(AppImages.addressIcon,color: ColorsManager.darkGreyColor),
                          Flexible(
                            child: AutoSizeText(
                              AppStrings.address(context: context,),
                              style: TextStyles.font14Regular,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText(":"),
                    Flexible(
                      child: AutoSizeText(
                        "Alexa SmithAlexa SmithAlexa SmithAlexa SmithAlexa Smith",
                        style: TextStyles.font14Regular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Row(
//   mainAxisAlignment: MainAxisAlignment.start,
//   spacing: AppWidth.w12,
//   children: [
//     Row(
//       spacing: AppWidth.w6,
//       children: [
//         SvgPicture.asset(AppImages.phoneIcon),
//         AutoSizeText(
//           AppStrings.phone(context: context),
//           style: TextStyles.font14Regular,
//         ),
//       ],
//     ),
//     AutoSizeText(":"),
//     AutoSizeText(
//       "+100 12457896",
//       style: TextStyles.font14Regular,
//       maxLines: 1,
//     ),
//   ],
// ),
// Row(
//   spacing: AppWidth.w12,
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       spacing: AppWidth.w6,
//       children: [
//         SvgPicture.asset(
//           AppImages.addressIcon,
//           color: ColorsManager.darkGreyColor,
//         ),
//         AutoSizeText(
//           AppStrings.address(context: context),
//           style: TextStyles.font14Regular,
//         ),
//       ],
//     ),
//     AutoSizeText(":"),
//     AutoSizeText(
//       "California City, USA",
//       style: TextStyles.font14Regular,
//       maxLines: 1,
//     ),
//   ],
// ),
