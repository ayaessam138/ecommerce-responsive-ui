import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_values.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppWidth.w6,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: RatingBar.builder(
              ignoreGestures: true,
              initialRating: 2,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 22.sp,
              // itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
              itemBuilder:
                  (context, _) => Icon(Icons.star, color: ColorsManager.yellow),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
        ),
        AutoSizeText(
          "(${113})",
          style: TextStyles.font12Regular.copyWith(
            color: ColorsManager.darkGreyColor,
          ),
        ),
      ],
    );
  }
}
