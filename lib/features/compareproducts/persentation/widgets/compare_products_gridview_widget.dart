
import 'package:client/core/helpers/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'compare_products_gridview_item_widget.dart';


class CompareProductsGridviewWidget extends StatelessWidget {
  const CompareProductsGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double spacing = 11.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing,vertical: AppHeight.h16),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(
            44,
                (index) => SizedBox(
              width: itemWidth,
              child: CompareProductsGridviewItemWidget(),
            ),
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
