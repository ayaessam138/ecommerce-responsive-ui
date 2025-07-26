import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/features/product/persentation/widgets/product_details/product_color_selector_widget.dart';
import 'package:client/features/product/persentation/widgets/product_details/product_delivery_info_widget.dart';
import 'package:client/features/product/persentation/widgets/product_details/product_details_info_widget.dart';
import 'package:client/features/product/persentation/widgets/product_details/product_key_information_widget.dart';
import 'package:client/features/product/persentation/widgets/product_details/product_size_guide_widget.dart';
import 'package:client/features/product/persentation/widgets/product_details/product_size_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/app_images.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.fullWidth(context),
      padding: EdgeInsets.all(AppPadding.p12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r8),
        border: Border.all(color: ColorsManager.lightGreyColor),
      ),
      child: Column(
        spacing: AppHeight.h12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            AppStrings.unitPrice(context: context),
            style: TextStyles.font16Semi,
          ),
          Row(
            spacing: AppWidth.w16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: AppWidth.w6,
                children: [
                  AutoSizeText("\$28", style: TextStyles.font16Semi),
                  AutoSizeText(
                    "\$30",
                    style: TextStyles.font16Semi.copyWith(
                      color: ColorsManager.greyColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidth.w12,
                  vertical: AppHeight.h6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                  border: Border.all(color: ColorsManager.greyColor),
                ),
                child: Row(
                  spacing: AppWidth.w16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppImages.decrementIcon),
                    AutoSizeText("1", style: TextStyles.font16Semi),
                    SvgPicture.asset(AppImages.incrementIcon,color:  ColorsManager.mainColor,),
                  ],
                ),
              ),
            ],
          ),
          ProductColorSelector(),
          ProductSizeSelectorWidget(),
          ProductDeliveryInfoWidget(),

          ProductSizeGuideWidget(
            productProperty: AppStrings.sizeGuide(context: context),
            onTap: () {
              showSizeGuideBottomSheet(context);
            },
          ),
          ProductSizeGuideWidget(
            productProperty: AppStrings.keyInformation(context: context),
            onTap: () {
              showBottomSheetProductKeyInfo(context);
            },
          ),
          ProductInfoWidget(),
        ],
      ),
    );
  }
}
