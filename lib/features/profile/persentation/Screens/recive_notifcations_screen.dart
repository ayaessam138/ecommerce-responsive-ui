
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/appbar_widget.dart';
import '../widgets/settings/recive_notifcations_toggle_widget.dart';

class ReceiveNotificationsScreen extends StatelessWidget {
  const ReceiveNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidget(title: AppStrings.notifications(context: context),),
              Padding(
                padding: EdgeInsets.all(AppPadding.p20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppSpace.vertical(AppHeight.fullHeight(context) * .1),
                    SvgPicture.asset(
                      AppImages.toggleNotification,
                      height: AppHeight.fullHeight(context) * .22,
                    ),
                    AppSpace.vertical(AppHeight.h24),
                    Text(
                      AppStrings.turnOnNotifcations(context: context),
                      style: TextStyles.font20Bold,
                    ),
                    AppSpace.vertical(AppHeight.h8),
                    Text(
                      textAlign: TextAlign.center,
                      AppStrings
                          .enableNotifcationsToMakeSureThatYouDoNotMissOutOnTheTopicsYouHaveSubscribedTo(context: context),
                      style: TextStyles.font16Regular.copyWith(
                        color: ColorsManager.darkGreyColor,
                      ),
                    ),
                    AppSpace.vertical(AppHeight.h32),
                    ReceiveNotificationsScreenToggleWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
