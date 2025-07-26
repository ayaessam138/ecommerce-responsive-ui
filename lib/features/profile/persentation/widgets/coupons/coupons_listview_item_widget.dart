import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'coupon_details_widget.dart';

class CouponsListviewItemWidget extends StatefulWidget {
  const CouponsListviewItemWidget({super.key});

  @override
  State<CouponsListviewItemWidget> createState() =>
      _CouponsListviewItemWidgetState();
}

class _CouponsListviewItemWidgetState extends State<CouponsListviewItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreyColor),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // Icon
                  Container(
                    padding: EdgeInsets.all(AppPadding.p10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsManager.lightGreyColor),
                    ),
                    child: SvgPicture.asset(AppImages.couponIcon),
                  ),
                  SizedBox(width: AppWidth.w16),

                  // Texts
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "50% OFF UP TO",
                          style: TextStyles.font16Medium.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          "Save 120 Using Code",
                          style: TextStyles.font14Regular.copyWith(
                            color: ColorsManager.greyColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),

                  // Amount & Code
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.w10,
                        vertical: AppHeight.h3,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.yellow,
                        borderRadius: BorderRadius.circular(AppRadius.r6),
                      ),
                      child: AutoSizeText(
                        textAlign: TextAlign.center,
                        "WELCOME50",
                        style: TextStyles.font12Bold.copyWith(
                          overflow: TextOverflow.ellipsis,

                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Details
          AnimatedCrossFade(
            firstChild: SizedBox.shrink(),
            secondChild: Column(
              children: const [
                CouponDeatailsWidget(
                  couponDeatails: 'This Offer is personalized for you',
                ),
                CouponDeatailsWidget(
                  couponDeatails: 'Maximum instant discount of 200',
                ),
                CouponDeatailsWidget(
                  couponDeatails: 'Applicable only on selected store',
                ),
              ],
            ),
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),

          // Bottom Section
          Container(
            padding: EdgeInsets.all(AppPadding.p12),
            width: AppWidth.fullWidth(context),
            height: AppHeight.fullHeight(context)*.06,
            decoration: BoxDecoration(
              color: ColorsManager.lightGreyColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppRadius.r12),
                bottomRight: Radius.circular(AppRadius.r12),
              ),
            ),
            child: Center(
              child: AutoSizeText(
                AppStrings.tapToApply(context: context),
                style: TextStyles.font14Bold.copyWith(
                  color: ColorsManager.mainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class CouponsListviewItemWidget extends StatelessWidget {
//   const CouponsListviewItemWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: ColorsManager.lightGreyColor),
//         borderRadius: BorderRadius.circular(AppRadius.r12),
//       ),
//       child: Column(
//         children: [
//           Theme(
//             data: Theme.of(context).copyWith(
//               splashColor: Colors.transparent, // يشيل تأثير الضغط
//               highlightColor: Colors.transparent, // يشيل لون الهايلايت
//               hoverColor: Colors.transparent,
//             ),
//             child: ExpansionTile(
//               visualDensity: VisualDensity.compact,
//               tilePadding: EdgeInsets.zero,
//               backgroundColor: Colors.transparent,
//               collapsedBackgroundColor: Colors.transparent,
//               shape: Border.all(color: Colors.transparent),
//               childrenPadding: EdgeInsets.zero, //
//               trailing: Transform.translate(
//                 offset: Offset(20, 0), // أو القيمة اللي تشيل المساحة
//                 child: const SizedBox.shrink(),
//               ),
//               title: Row(
//                 spacing: AppWidth.w6,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(AppPadding.p10),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: ColorsManager.lightGreyColor),
//                       ),
//                       child: SvgPicture.asset(AppImages.couponIcon),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AutoSizeText(
//                           maxLines: 1,
//                           "50% OFF UP TO",
//                           style: TextStyles.font16Medium,
//                         ),
//                         AutoSizeText(
//                           maxLines: 2,
//                           "Save 120 Using Code",
//                           style: TextStyles.font14Regular.copyWith(
//                             color: ColorsManager.greyColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         AutoSizeText(
//                           maxLines: 1,
//                           "120",
//                           style: TextStyles.font16Medium,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: AppWidth.w10,
//                             vertical: AppHeight.h3,
//                           ),
//                           decoration: BoxDecoration(
//                             color: ColorsManager.yellow,
//                             borderRadius: BorderRadius.circular(AppRadius.r6),
//                           ),
//                           child: AutoSizeText(
//                             "WELCOME50",
//                             style: TextStyles.font12Bold,
//                             maxLines: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               children: [
//                 Column(
//                   children: [
//                     CouponDeatailsWidget(
//                       couponDeatails: 'This Offer is personalized for you',
//                     ),
//                     CouponDeatailsWidget(
//                       couponDeatails: 'Maximum instant discount of 200',
//                     ),
//                     CouponDeatailsWidget(
//                       couponDeatails: 'Applicable only on sleeted store',
//                     ),
//                   ],
//                 ), // bullet point
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(AppPadding.p16),
//             width: AppWidth.fullWidth(context),
//             decoration: BoxDecoration(
//               color: ColorsManager.lightGreyColor,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(AppRadius.r12),
//                 bottomRight: Radius.circular(AppRadius.r12),
//               ),
//             ),
//             child: Center(
//               child: AutoSizeText(
//                 AppStrings.tapToApply(context: context),
//                 style: TextStyles.font14Bold.copyWith(
//                   color: ColorsManager.mainColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
