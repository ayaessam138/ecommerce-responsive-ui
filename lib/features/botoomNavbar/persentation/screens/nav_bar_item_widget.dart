
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedNavBarItemWidget extends StatelessWidget {
  const SelectedNavBarItemWidget({
    super.key,
    required this.imagePath,
    required this.label,
  });
  final String imagePath;
  final String label;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Column(
        children: [
          SvgPicture.asset(imagePath),
          Text(
            label,
            style: TextStyles.font14Regular.copyWith(
              color: ColorsManager.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
