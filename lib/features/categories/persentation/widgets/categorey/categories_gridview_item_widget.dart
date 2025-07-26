import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoriesGridviewItemWidget extends StatelessWidget {

  final String imagePath;
  final String name;

  const CategoriesGridviewItemWidget({
    super.key,

    required this.imagePath,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNamed(context, AppRoutes.categoryProductRoute);
      },
      child: Column(
        spacing: AppHeight.h3,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: AppWidth.fullWidth(context) * .5,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.mainColor),
                // color: ColorsManager.mainColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(imagePath, fit: BoxFit.fill),
              ),
            ),
          ),

          AutoSizeText(name, style: TextStyles.font14Regular, maxLines: 2),
        ],
      ),
    );
  }
}
