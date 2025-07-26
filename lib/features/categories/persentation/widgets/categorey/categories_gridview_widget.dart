import 'package:client/core/helpers/app_images.dart' show AppImages;
import 'package:client/features/categories/persentation/widgets/categorey/categories_gridview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridviewWidget extends StatelessWidget {
  CategoriesGridviewWidget({super.key});

  final List<String> images = [
    AppImages.categoreyMen,
    AppImages.categoreyWomen,
    AppImages.categoreyKids,
    AppImages.categoreyMen,
    AppImages.categoreyWomen,
    AppImages.categoreyKids,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 11.w,
        mainAxisSpacing: 11.h,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return CategoriesGridviewItemWidget(
          // categoryColor: images[index],
          imagePath: images[index],
          name: index.isEven ? "Men" : "Women",
        );
      },
    );
  }
}
