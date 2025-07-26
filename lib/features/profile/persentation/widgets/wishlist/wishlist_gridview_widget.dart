import 'package:client/core/helpers/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../product/persentation/widgets/products/products_gridview_item_widget.dart';

class WishlistGridviewWidget extends StatelessWidget {
  const WishlistGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double spacing = 11.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(
            44,
            (index) =>
                SizedBox(width: itemWidth, child: ProductGridviewItemWidget(showCompare: false,)),
          ),
        ),
      ),
    );
  }
}




// class WishlistGridviewWidget extends StatelessWidget {
//   const WishlistGridviewWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(AppPadding.p16),
//       shrinkWrap: true,
//       physics: const AlwaysScrollableScrollPhysics(),
//       itemCount: 44,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 11.w,
//         mainAxisSpacing: 11.h,
//         childAspectRatio: 0.5,
//       ),
//       itemBuilder: (context, index) {
//         return WishlistGridviewItemWidget();
//       },
//     );
//   }
// }

// class WishlistGridviewItemWidget extends StatelessWidget {
//   const WishlistGridviewItemWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: AppHeight.h12,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 4,
//           child: Stack(
//             children: [
//               Container(color: ColorsManager.redColor,child: SvgPicture.asset(AppImages.emptyOrderHistory)),
//               Positioned(
//                 right: AppHeight.h12,
//                 top: AppHeight.h12,
//                 child: SvgPicture.asset(AppImages.favIcon),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 5,
//           child: Column(
//             spacing: AppHeight.h6,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AutoSizeText(
//                 "Men’s WatchMen’s",
//                 style: TextStyles.font14Bold,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               ProductRating(),
//               AutoSizeText(
//                 "X FashionX Fashion",
//                 style: TextStyles.font14Regular.copyWith(
//                   color: ColorsManager.greyColor,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//
//               Row(
//                 spacing: AppWidth.w8,
//                 children: [
//                   AutoSizeText(
//                     "\$28.56", // current price
//                     style: TextStyles.font14Semi,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                   AutoSizeText(
//                     "\$45.00", // original price before sale
//                     style: TextStyles.font12Regular.copyWith(
//                       color: ColorsManager.greyColor,
//                       decoration: TextDecoration.lineThrough,
//                       decorationColor: ColorsManager.greyColor,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//               CounterAddToCartWidget(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
