
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ReceiveNotificationsScreenToggleWidget extends StatelessWidget {
  const ReceiveNotificationsScreenToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
        color: ColorsManager.moreLightGreyColor,
        borderRadius: BorderRadius.circular(AppRadius.rDefault),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 3.sp,
            children: [
              SvgPicture.asset(AppImages.noticationIcon),
              Text(AppStrings.notifications(context: context), style: TextStyles.font16Medium),
            ],
          ),
          Switch(
            value: false,
            onChanged: (val){},
            activeColor: ColorsManager.greyColor,
            
          ),
        ],
      ),
    );
  }
}
