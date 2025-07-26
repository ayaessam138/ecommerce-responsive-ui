
import 'package:client/features/product/persentation/widgets/products/product_vertical_listview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helpers/app_spacing.dart';
import '../../../../../../core/helpers/app_values.dart';
import '../../../../product/persentation/widgets/products/products_gridview_item_widget.dart';

class CategoryProductsListviewWidget extends StatelessWidget {
  final bool isGridView;

  const CategoryProductsListviewWidget({super.key, required this.isGridView});

  @override
  Widget build(BuildContext context) {
    final double spacing = 11.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;
    if (isGridView) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: List.generate(
            44,
            (index) => SizedBox(
              width: itemWidth,
              child: ProductGridviewItemWidget(isOnSale: false),
            ),
          ),
        ),
      );
    } else {
      return ListView.separated(

        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w20),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ProductVerticalListviewItemWidget(isOnSale: false,); // Or a list-optimized variant
        },
        separatorBuilder: (BuildContext context, int index) {
          return AppSpace.vertical(AppHeight.h12);
        },
      );
    }
  }
}


