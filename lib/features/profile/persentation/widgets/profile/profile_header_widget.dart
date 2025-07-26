import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/features/profile/persentation/widgets/profile/profile_mainmenu_widget.dart';
import 'package:client/features/profile/persentation/widgets/profile/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_spacing.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart' show ColorsManager;
import '../../../../../core/theming/styles.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p16),
      color: ColorsManager.mainColor,
      child: Column(
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Transform.rotate(
              //   angle: context.locale.languageCode == "en" ? 0 : math.pi,
              //   child: SvgPicture.asset(
              //     AppImages.arrowIcon,
              //     color: ColorsManager.white,
              //   ),
              // ),
              AutoSizeText(
                AppStrings.myAccount(context: context),
                style: TextStyles.font18Bold.copyWith(
                  color: ColorsManager.white,
                ),
              ),

              InkWell(
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.notificationRoute);
                },
                child: SvgPicture.asset(
                  AppImages.noticationIcon,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
          AppSpace.vertical(AppHeight.h32),
          UserInfoWidget(),
          AppSpace.vertical(AppHeight.h16),
          Row(
            spacing: AppWidth.w12,
            children: [
              ProfileMaiMenuWidget(
                imagePath: AppImages.voucherIcon,
                title: AppStrings.myVoucher(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.couponsRoute);
                },
              ),
              ProfileMaiMenuWidget(
                imagePath: AppImages.myOrderIcon,
                title: AppStrings.myOrders(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.myOrderRoute);
                },
              ),
              ProfileMaiMenuWidget(
                imagePath: AppImages.favIcon,
                title: AppStrings.myFavorite(context: context),
                onTap: () {
                  AppNavigator.pushNamed(context, AppRoutes.wishListRoute);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
