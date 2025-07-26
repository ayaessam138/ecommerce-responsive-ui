import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class OffersCategoryListviewItemWidget extends StatelessWidget {
  const OffersCategoryListviewItemWidget({
    super.key,
    required this.categoryColor,
  });

  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNamed(context, AppRoutes.categoryProductRoute);
      },
      child: SizedBox(
        width: 80.w, // ✅ عرض ثابت لكل عنصر في الليست
        child: Column(
          spacing: AppHeight.h10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: AppHeight.fullHeight(context) * .1,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: SvgPicture.asset(AppImages.cartIcon),
              ),
            ),

            AutoSizeText(
              "Women",
              style: TextStyles.font14Regular,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


// class OffersCategoryListviewItemWidget extends StatelessWidget {
//   const OffersCategoryListviewItemWidget({
//     super.key,
//     required this.categoryColor,
//   });
//   final Color categoryColor;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         AppNavigator.pushNamed(context, AppRoutes.categoryProductRoute);
//       },
//       child: Column(
//         spacing: AppHeight.h10,
//         children: [
//           Container(
//             height: AppHeight.fullHeight(context) * .1,
//             padding: EdgeInsets.all(8.w),
//             decoration: BoxDecoration(
//               color: categoryColor,
//               borderRadius: BorderRadius.circular(12.r),
//             ),
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: SvgPicture.asset(AppImages.cartIcon),
//             ),
//           ),
//
//           Wrap(children: [AutoSizeText("Women", style: TextStyles.font14Regular)]),
//         ],
//       ),
//     );
//   }
// }
