import 'package:client/core/helpers/app_values.dart';
import 'package:client/features/product/persentation/widgets/products/products_gridview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OffersProductGridviewWidget extends StatelessWidget {
  const OffersProductGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double spacing = 11.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: List.generate(
          20,
          (index) => SizedBox(
            width: itemWidth,
            child: ProductGridviewItemWidget(isOnSale: true,),
          ),
        ),
      ),
    );
  }
}

// class OffersProductGridviewWidget extends StatelessWidget {
//   const OffersProductGridviewWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 44,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 11.w,
//         mainAxisSpacing: 11.h,
//         childAspectRatio: 0.6,
//       ),
//       itemBuilder: (context, index) {
//         return OffersProductGridviewItemWidget();
//       },
//     );
//   }
// }
