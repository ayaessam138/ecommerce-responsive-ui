import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/theming/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helpers/app_images.dart';
import '../../core/helpers/app_strings.dart' show AppStrings;
import '../../core/helpers/app_values.dart';
import '../../core/theming/styles.dart';
import 'sortfilter_bottom_sheet_widget.dart';

class ProductSortFilterWidget extends StatelessWidget {
  const ProductSortFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.fullWidth(context),
      padding: EdgeInsets.all(AppPadding.p10),
      height: AppHeight.fullHeight(context) * .08,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [ColorsManager.greyColor, Colors.black.withOpacity(0.03)],
        ),
      ),
      child:
      Row(
        spacing: AppWidth.w16,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                showBottomSheetCategorySortFilter(context,0);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p8,
                  horizontal: AppPadding.p8,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppWidth.w6,
                  children: [
                    AutoSizeText(
                      AppStrings.sort(context: context),
                      style: TextStyles.font16Bold,
                    ),
                    SvgPicture.asset(
                      AppImages.sortIcon,
                      height: 18.h,
                      width: 18.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                showBottomSheetCategorySortFilter(context,1);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p8,
                  horizontal: AppPadding.p8,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: AppWidth.w6,

                  children: [
                    AutoSizeText(
                      AppStrings.filter(context: context),
                      style: TextStyles.font16Bold,
                    ),
                    SvgPicture.asset(
                      AppImages.filterIcon,
                      height: 18.h,
                      width: 18.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
