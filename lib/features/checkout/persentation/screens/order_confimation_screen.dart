import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    spacing: AppHeight.h12,
                    children: [
                      SizedBox(height: AppHeight.h20),
                      SizedBox(
                        height: AppHeight.fullHeight(context) * .13,
                        child: Center(
                          child: SvgPicture.asset(AppImages.orderConfirm),
                        ),
                      ),
                      AutoSizeText(
                        AppStrings.congratulations(context: context),
                        style: TextStyles.font24Bold,
                      ),
                      AutoSizeText(
                        textAlign: TextAlign.center,
                        "Hi Alexa Smith - thanks for your order, we hope you enjoyed shopping with us.",
                        style: TextStyles.font16Regular.copyWith(
                          color: ColorsManager.greyColor,
                        ),
                      ),
                      Column(
                        spacing: AppHeight.h12,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderConfirmationWidget(
                            imagePath: AppImages.orderIdIcon,
                            title: AppStrings.orderId(context: context),
                            subTitle: "#3456",
                          ),
                          OrderConfirmationWidget(
                            imagePath: AppImages.orderItemsIcon,
                            title: AppStrings.orderItem(context: context),
                            subTitle: '20 Items',
                          ),
                          OrderConfirmationWidget(
                            imagePath: AppImages.confirmOrderIcon,
                            title: AppStrings.confirmWillBeSentToYourAppSms(
                              context: context,
                            ),
                            subTitle: 'Check your App or Phone SMS',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(height: AppHeight.h1),
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Row(
                spacing: AppWidth.w16,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButton(
                      buttoncolor: ColorsManager.white,
                      buttonTextcolor: ColorsManager.black,
                      bordercolor: ColorsManager.lightGreyColor,
                      title: AppStrings.backTomHome(context: context),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      title: AppStrings.trackOrder(context: context),
                      onTap: () {
                        AppNavigator.pushNamed(context, AppRoutes.myOrderDetailsRoute);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderConfirmationWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;

  const OrderConfirmationWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppWidth.w16,
      children: [
        Container(
          padding: EdgeInsets.all(AppPadding.p16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorsManager.greyColor),
          ),
          child: SvgPicture.asset(imagePath, fit: BoxFit.cover),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                title,
                maxLines: 1,
                style: TextStyles.font14Regular.copyWith(
                  color: ColorsManager.greyColor,
                ),
              ),
              AutoSizeText(subTitle, style: TextStyles.font14Bold, maxLines: 1),
            ],
          ),
        ),
      ],
    );
  }
}
