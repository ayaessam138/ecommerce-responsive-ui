import 'package:client/core/helpers/app_values.dart';
import 'package:client/features/product/persentation/widgets/products/products_gridview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AllProductGridviewWidget extends StatelessWidget {
  const AllProductGridviewWidget({super.key});

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
                (index) => SizedBox(
              width: itemWidth,
              child: ProductGridviewItemWidget(),
            ),
          ),
        ),
      ),
    );
  }
}


