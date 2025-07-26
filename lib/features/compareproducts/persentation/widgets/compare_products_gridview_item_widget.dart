import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../core/widgets/counter_add_to_cart_widget.dart';
import '../../../../core/widgets/product._rating.dart';

class CompareProductsGridviewItemWidget extends StatelessWidget {
  const CompareProductsGridviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              // color: ColorsManager.redColor,
              child: Image.asset(AppImages.product),
            ),
            Positioned(
              right: AppHeight.h12,
              top: AppHeight.h12,
              child: Column(
                spacing: AppHeight.h6,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite_border,
                      color: ColorsManager.greyColor,
                    ),
                  ),

                  GestureDetector(
                    onTap: (){},
                    child: Icon(Icons.delete, color: ColorsManager.greyColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          spacing: AppHeight.h6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Men’s WatchMen’s",
              style: TextStyles.font14Bold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            ProductRating(),
            AutoSizeText(
              "X FashionX Fashion",
              style: TextStyles.font14Regular.copyWith(
                color: ColorsManager.greyColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              spacing: AppWidth.w8,
              children: [
                AutoSizeText(
                  "\$28.56", // current price
                  style: TextStyles.font14Semi,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                AutoSizeText(
                  "\$45.00", // original price before sale
                  style: TextStyles.font12Regular.copyWith(
                    color: ColorsManager.greyColor,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: ColorsManager.greyColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            CounterAddToCartWidget(),
          ],
        ),
      ],
    );
  }
}
