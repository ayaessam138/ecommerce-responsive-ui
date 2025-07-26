
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/app_spacing.dart';
import '../../../core/helpers/app_values.dart';
import '../../../core/theming/styles.dart';
import 'empty_screen_button.dart';

class EmptyScreensWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String buttonTitle;

  const EmptyScreensWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              SvgPicture.asset(imagePath),
              AppSpace.vertical(AppHeight.h24),
              AutoSizeText(title, style: TextStyles.font18Bold),
              AppSpace.vertical(AppHeight.h6),
              AutoSizeText(subTitle, style: TextStyles.font14Regular,textAlign: TextAlign.center,),
              AppSpace.vertical(AppHeight.h24),
              Padding(
                padding: EdgeInsets.all(AppPadding.p30),
                child: AppButton(title: buttonTitle, onTap: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
