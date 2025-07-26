import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class MyOrderDetailsComponentsListviewItemWidget extends StatelessWidget {
  const MyOrderDetailsComponentsListviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppWidth.w6,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r12),
         //  color: ColorsManager.redColor,
          ),
          width: 90.w,
          height: 80.h,
          child: Image.asset(
            AppImages.product,
            width: AppWidth.fullWidth(context) * .5,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Men’s WatchMen’ ",
                style: TextStyles.font14Bold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                "X Fashion",
                style: TextStyles.font12Regular.copyWith(
                  color: ColorsManager.greyColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                spacing: AppWidth.w8,
                children: [
                  AutoSizeText(
                    "\$28.56", // current price
                    style: TextStyles.font14Semi.copyWith(
                      color: ColorsManager.mainColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  AutoSizeText(
                    "\$45.00", // original price before sale
                    style: TextStyles.font12Regular.copyWith(
                      color: ColorsManager.greyColor,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: ColorsManager.greyColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Spacer(),
        // Icon(Icons.rate_review)
        AppButton(title: AppStrings.rate(context: context), onTap: () {
          AppNavigator.pushNamed(context, AppRoutes.productReviewRoute);
        }),
      ],
    );
  }
}
