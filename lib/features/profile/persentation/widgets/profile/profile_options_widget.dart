import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_images.dart';

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget({
    super.key,
    required this.imagePath,
    required this.optionName,
    required this.onTap,
    this.imageColor,
    this.showDivider = true,
  });
  final String imagePath;
  final String optionName;
  final void Function() onTap;
  final Color? imageColor;
  final bool showDivider;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w16,
          vertical: AppHeight.h12,
        ),
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Column(
            spacing: AppHeight.h8,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      spacing: AppWidth.w16,
                      children: [
                        SvgPicture.asset(imagePath, color: imageColor ?? null),
                        Expanded(
                          child: AutoSizeText(
                            maxLines: 1,
                            optionName,
                            style: TextStyles.font16Regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: context.locale.languageCode == "en" ? math.pi : 0,

                    child: SvgPicture.asset(AppImages.arrowIcon),
                  ),
                ],
              ),
              showDivider ? Divider(height: AppHeight.h1) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
