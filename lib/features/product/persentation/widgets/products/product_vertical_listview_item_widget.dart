import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/widgets/product._rating.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_strings.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/counter_add_to_cart_widget.dart';

class ProductVerticalListviewItemWidget extends StatelessWidget {
  const ProductVerticalListviewItemWidget({super.key,  this.isOnSale=true});
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.pushNamed(context, AppRoutes.productDetailsRoute);
      },
      child: Row(
        spacing: AppHeight.h10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.r12),
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.product,
                    width: AppWidth.fullWidth(context) * .5,
                  ),
                 isOnSale? Positioned(
                    top: AppHeight.h12,
                    left:
                        Directionality.of(context) == TextDirection.rtl
                            ? null
                            : 0,
                    right:
                        Directionality.of(context) == TextDirection.ltr
                            ? 0
                            : null,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppWidth.w8,
                        vertical: AppHeight.h4,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.redColor,
                        borderRadius:
                            Directionality.of(context) == TextDirection.rtl
                                ? BorderRadius.only(
                                  topLeft: Radius.circular(AppRadius.r4),
                                  bottomLeft: Radius.circular(AppRadius.r4),
                                )
                                : BorderRadius.only(
                                  topRight: Radius.circular(AppRadius.r4),
                                  bottomRight: Radius.circular(AppRadius.r4),
                                ),
                      ),
                      child: Text(
                        AppStrings.sale(context: context),
                        style: TextStyles.font10Bold.copyWith(
                          color: ColorsManager.white,
                        ),
                      ),
                    ),
                  ):SizedBox.shrink(),
                  Positioned(
                    left:
                        Directionality.of(context) == TextDirection.rtl
                            ? AppHeight.h12
                            : null,
                    right:
                        Directionality.of(context) == TextDirection.ltr
                            ? AppHeight.h12
                            : null,
                    child: Icon(
                      Icons.favorite_border,
                      color: ColorsManager.greyColor,
                    ),
                  ),
                  Positioned(
                    left:
                        Directionality.of(context) == TextDirection.rtl
                            ? AppHeight.h12
                            : null,
                    right:
                        Directionality.of(context) == TextDirection.ltr
                            ? AppHeight.h12
                            : null,
                    top: AppHeight.h32,

                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.pushNamed(
                          context,
                          AppRoutes.compareProductRoute,
                        );
                      },
                      child: Icon(
                        Icons.compare_arrows,
                        color: ColorsManager.greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Column(
              spacing: AppHeight.h8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Men’s Suite ",
                  style: TextStyles.font14Bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                ProductRating(),
                AutoSizeText(
                  "X Fashion",
                  style: TextStyles.font12Regular.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                  maxLines: 1,
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
          ),
        ],
      ),
    );
  }
}
