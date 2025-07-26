import 'package:flutter/material.dart';

import '../helpers/app_values.dart';
import '../theming/colors.dart';

class DotsIndicator extends StatelessWidget {
  final bool isActive;
  final Color? activeColor;
  final Color? inactiveColor;

  const DotsIndicator({
    super.key,
    required this.isActive,
    this.activeColor,
    this.inactiveColor,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 255),
      width: isActive ?AppWidth.w20:AppWidth.w10,
      height: AppHeight.h10,
      decoration: BoxDecoration(
        borderRadius: isActive
            ? BorderRadius.circular(4)
            : BorderRadius.circular(100),
        // shape: isActive?BoxShape.rectangle:BoxShape.circle,
        color:
            isActive
                ? activeColor ?? ColorsManager.mainColor
                : inactiveColor ?? ColorsManager.mainColor.withOpacity(0.5),
      ),
    );
  }
}
