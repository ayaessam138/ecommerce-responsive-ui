import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_values.dart' show AppHeight, AppPadding, AppRadius, AppWidth;
import '../../../../../core/theming/colors.dart' show ColorsManager;
import '../../../../../core/theming/styles.dart';
import '../../../../emptysecreens/widgets/empty_screen_button.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r12),
        border: Border.all(color: ColorsManager.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            spacing: AppWidth.w12,
            children: [
              Image.asset(
                AppImages.profileAvatar,
                height: AppHeight.fullHeight(context) * .08,
              ),
              Text(
                "Hello , Alexa Smith",
                style: TextStyles.font16Semi.copyWith(
                  color: ColorsManager.white,
                ),
              ),
              AppButton(
                buttoncolor: ColorsManager.yellow,
                title: "Pro",
                onTap: () {},
                width: AppWidth.fullWidth(context) * .18,
              ),

            ],
          ),
          // InkWell(
          //   onTap: () {},
          //   child: SvgPicture.asset(AppImages.editProfileIcon),
          // ),
        ],
      ),
    );
  }
}