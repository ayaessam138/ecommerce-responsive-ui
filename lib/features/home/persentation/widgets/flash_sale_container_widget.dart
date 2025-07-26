import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/features/home/persentation/widgets/sales_contanier_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'count_down_flash_sale_widget.dart';

class FlashSaleContainerWidget extends StatelessWidget {
  const FlashSaleContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.fullWidth(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SalesContainerWidget(),
          Padding(
            padding: EdgeInsets.all(AppPadding.p12),
            child: Column(
              spacing: AppHeight.h12,
              children: [
                AutoSizeText(
                  "Super Flash Sale ",
                  style: TextStyles.font18Bold.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
                AutoSizeText(
                  "60% off",
                  style: TextStyles.font20Bold.copyWith(
                    color: ColorsManager.white,
                  ),
                ),
                SvgPicture.asset(AppImages.flashSaleIcon),
                CountDownFlashSaleWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
