import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/cubit/settings_cubit.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/location_helper.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  @override
  void initState() {
    super.initState();

    // ⬇️ تبدأ تتبع الموقع
    context.read<SettingsCubit>().startPermissionMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.deliveryTo(context: context),
                style: TextStyles.font14Regular.copyWith(
                  color: ColorsManager.darkGreyColor,
                ),
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  String addressText = AppStrings.unknownLocation(
                    context: context,
                  );
                  final cachedPlaceMark = LocationHelper.initialPlacemark;
                  if (state is LocationLoaded) {
                    addressText =
                        state.placeMark?.locality ??
                        AppStrings.unknownLocation(context: context);
                  } else if (state is LocationPermissionDenied ||
                      state is LocationDisabled) {
                    if (cachedPlaceMark?.locality != null &&
                        cachedPlaceMark!.locality!.isNotEmpty) {
                      addressText = cachedPlaceMark.locality!;
                    } else {
                      //in case of first time we do not have cash and user denied access
                      addressText = AppStrings.pleaseOpenYourLocation(
                        context: context,
                      );
                    }
                  } else if (state is LocationPermissionDeniedForever) {
                    addressText = AppStrings.pleaseOpenYourLocation(
                      context: context,
                    );
                  } else if (state is LocationError) {
                    addressText = state.errorMessage;
                  } else if (state is LocationLoading) {
                    addressText = "";
                  } else {
                    // حالة غير معروفة، افتراضياً
                    addressText = AppStrings.unknownLocation(context: context);
                  }

                  return Row(
                    children: [
                      SvgPicture.asset(AppImages.locationIcon),
                      SizedBox(width: AppWidth.w6),
                      Flexible(
                        child: AutoSizeText(
                          addressText,
                          style: TextStyles.font14Regular,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Row(
          spacing: AppWidth.w12,
          children: [
            GestureDetector(
              onTap: () {
                AppNavigator.pushNamed(context, AppRoutes.notificationRoute);
              },
              child: Container(
                padding: EdgeInsets.all(AppPadding.p6),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.lightGreyColor),
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: SvgPicture.asset(AppImages.noticationIcon),
              ),
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.pushNamed(context, AppRoutes.cartRoute);
              },
              child: Container(
                padding: EdgeInsets.all(AppPadding.p6),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.lightGreyColor),
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
                child: SvgPicture.asset(AppImages.cartIcon),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


