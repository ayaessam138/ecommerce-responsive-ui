import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AddressTypeWidget extends StatelessWidget {
  const AddressTypeWidget({
    super.key,
    required this.imagePath,
    required this.addressType,
    required this.isSelected,
    required this.onTap,
  });

  final String imagePath;
  final String addressType;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.r8),
        child: Container(
          padding: EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            color: isSelected ? ColorsManager.mainColor : ColorsManager.lightGreyColor,
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(
              color: isSelected ? ColorsManager.mainColor : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppWidth.w3,
            children: [
              Flexible(
                child: SvgPicture.asset(
                  imagePath,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              AutoSizeText(
                maxLines: 1,
                addressType,
                style: TextStyles.font12Medium.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
