

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';

class HomeListTitleWidget extends StatelessWidget {
  const HomeListTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: AutoSizeText(title, style: TextStyles.font18Bold,maxLines: 1,)),
        InkWell(
          onTap: onTap,
          child: AutoSizeText(
            AppStrings.seeALL(context: context),
            style: TextStyles.font16Regular.copyWith(
              color: ColorsManager.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
