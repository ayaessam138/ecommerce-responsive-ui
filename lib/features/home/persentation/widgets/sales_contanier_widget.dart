import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';

class SalesContainerWidget extends StatelessWidget {
  const SalesContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.fullWidth(context),
      height: 180.h,
      decoration: BoxDecoration(
        // color: ColorsManager.mainColor,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.r12),
            child: Image.asset(AppImages.banner, fit: BoxFit.fill),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r12),
              color: ColorsManager.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
