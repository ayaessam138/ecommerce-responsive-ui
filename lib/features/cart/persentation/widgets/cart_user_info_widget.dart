import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CartUserInfo extends StatelessWidget {
  const CartUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: AppWidth.w12,
              children: [
                SvgPicture.asset(AppImages.homeAddressIcon),
                AutoSizeText(
                  "Home Address",
                  style: TextStyles.font16Semi,
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                AppNavigator.pushNamed(context, AppRoutes.addAddressRoute);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w14,
                  vertical: AppHeight.h4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                  border: Border.all(color: ColorsManager.lightGreyColor),
                ),
                child: AutoSizeText(
                  AppStrings.change(context: context),
                  style: TextStyles.font14Medium,
                ),
              ),
            ),
          ],
        ),
        AppSpace.vertical(AppHeight.h6),
        Divider(height: AppHeight.h1),
        AppSpace.vertical(AppHeight.h12),
        Column(
          spacing: AppHeight.h12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeliveryInfo(
              icon: AppImages.userIcon,
              title: AppStrings.name(context: context),
              subTitle:
              'Alexa SmithAlexa SmithAlexa SmithAlexa SmithAlexa Smith',
            ),
            DeliveryInfo(
              icon: AppImages.phoneIcon,
              title: AppStrings.phone(context: context),
              subTitle: "02009858848",
            ),
            DeliveryInfo(
              icon: AppImages.addressIcon,
              title: AppStrings.address(context: context),
              subTitle:
              'Alexa SmithAlexa SmithAlexa SmithAlexa SmithAlexa Smith',
            ),
          ],
        ),
      ],
    );
  }
}

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final String icon;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          spacing: AppWidth.w12,
          children: [
            SizedBox(
              width: constraints.maxWidth * .3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: AppWidth.w6,
                children: [
                  SvgPicture.asset(icon),
                  Flexible(
                    child: AutoSizeText(
                      title,
                      style: TextStyles.font14Regular,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            AutoSizeText(":"),
            Flexible(
              flex: 9,
              child: AutoSizeText(
                subTitle,
                style: TextStyles.font14Regular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}