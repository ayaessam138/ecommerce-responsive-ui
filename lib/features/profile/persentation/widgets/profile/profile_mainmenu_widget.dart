import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class ProfileMaiMenuWidget extends StatelessWidget {
  const ProfileMaiMenuWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });
  final String imagePath;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(AppPadding.p12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r12),
            border: Border.all(color: ColorsManager.white),
          ),
          child: Column(
            spacing: AppHeight.h8,
            children: [
              SvgPicture.asset(imagePath,color: ColorsManager.white,),
              FittedBox(
                child: AutoSizeText(
                  maxLines: 1,
                  title,
                  style: TextStyles.font16Medium.copyWith(color: ColorsManager.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
