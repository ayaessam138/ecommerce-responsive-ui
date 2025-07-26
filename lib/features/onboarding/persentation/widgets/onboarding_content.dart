import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_spacing.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/dots_indicator_widget.dart';


class OnBoardingPageContent extends StatelessWidget {
  final String imagePath;
  final String firstLabel;
  final String secondLabel;
  final int index;
  final void Function() onPressedNext;

  const OnBoardingPageContent({
    super.key,
    required this.imagePath,
    required this.firstLabel,
    required this.secondLabel,
    required this.index,
    required this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(AppRadius.r8),
              border: Border.all(color: ColorsManager.mainColor)
              ),
              child: ClipRRect(
                    borderRadius:BorderRadius.circular(AppRadius.r8),
                child: Image.asset(
                  imagePath,
                  width: AppWidth.fullWidth(context) * 0.7,
                  height: AppHeight.fullHeight(context) * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppWidth.w35,
              vertical: AppHeight.h25,
            ),
            width: AppWidth.fullWidth(context),
            decoration: BoxDecoration(color: ColorsManager.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  firstLabel,
                  style: TextStyles.font24Bold,
                  softWrap: true,
                  maxLines: 2,
                ),
                AppSpace.vertical(AppHeight.h12),
                AutoSizeText(
                  secondLabel,
                  style: TextStyles.font16Regular.copyWith(
                    color: ColorsManager.darkGreyColor,
                  ),
                  softWrap: true,
                  maxLines: 3,
                ),
                AppSpace.vertical(AppHeight.h32),
                Row(
                  spacing:  AppWidth.w10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotsIndicator(isActive: index == 0),
                    DotsIndicator(isActive: index == 1),
                    DotsIndicator(isActive: index == 2),
                  ],
                ),
                AppSpace.vertical(AppHeight.h24),
            
              ],
            ),
          ),
        ),
      ],
    );
  }
}
