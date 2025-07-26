import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class AddressListviewItemWidget extends StatelessWidget {
  const AddressListviewItemWidget({
    super.key,
    required this.addressType,
    required this.address,
    required this.addressIcon,
  });
  final String addressType;
  final String address;
  final String addressIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.lightGreyColor),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              color: ColorsManager.moreLightGreyColor,
              border: Border.all(color: ColorsManager.lightGreyColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.r12),
                topRight: Radius.circular(AppRadius.r12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    spacing: AppWidth.w10,
                    children: [
                      SvgPicture.asset(addressIcon),
                      Expanded(
                        child: AutoSizeText(
                          addressType,
                          style: TextStyles.font16Semi,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(AppImages.editAddressIcon),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: AutoSizeText(
              address,
              style: TextStyles.font14Regular.copyWith(
                color: ColorsManager.greyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
