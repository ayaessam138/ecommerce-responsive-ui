import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_strings.dart';
import '../../../../emptysecreens/widgets/empty_screen_button.dart' show AppButton;

void showBottomSheetDeleteAccount(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.r20)),
    ),
    backgroundColor: ColorsManager.white,

    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(AppPadding.p12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppHeight.h10,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:  EdgeInsets.all(AppPadding.p12),
                  child: Icon(Icons.close, color: ColorsManager.greyColor),
                ),
              ),
            ),
            SvgPicture.asset(
              AppImages.logOutPermission,
              // height: AppHeight.fullHeight(context) * .1,
            ),
            AutoSizeText(
              AppStrings.deleteAccount(context: context),
              style: TextStyles.font18Bold,
            ),
            AutoSizeText(
              textAlign: TextAlign.center,
              AppStrings.areYouSureThatYouWantToDeleteYourAccount(
                context: context,
              ),
              style: TextStyles.font16Regular.copyWith(
                color: ColorsManager.darkGreyColor,
              ),
            ),
            Flexible(
              child: AppButton(
                height: AppHeight.h56,
                title: AppStrings.keepIt(context: context),
                onTap: () {},
                bordercolor: ColorsManager.greyColor,
                buttoncolor: ColorsManager.white,
                buttonTextcolor: ColorsManager.black,
              ),
            ),
            Flexible(
              child: AppButton(
                height: AppHeight.h56,
                title: AppStrings.delete(context: context),
                onTap: () {},

                buttoncolor: ColorsManager.redColor,
                buttonTextcolor: ColorsManager.white,
              ),
            ),
          ],
        ),
      );
    },
  );
}