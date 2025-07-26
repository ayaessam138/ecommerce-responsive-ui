import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/widgets/counter_add_to_cart_widget.dart';
import '../../../../../core/widgets/product._rating.dart';

class ProductHorizontalListViewItemWidget extends StatelessWidget {
  final void Function() onTap;
  final bool isOnSale;

  const ProductHorizontalListViewItemWidget({
    super.key,
    required this.onTap,
    this.isOnSale = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppWidth.fullWidth(context) * .5,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              spacing: AppHeight.h6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        //color: ColorsManager.redColor,
                        child: Image.asset(
                          AppImages.product,
                          width: AppWidth.fullWidth(context) * .5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      isOnSale
                          ? Positioned(
                            top: AppHeight.h12,
                            left:
                                Directionality.of(context) == TextDirection.rtl
                                    ? null
                                    : 0,
                            right:
                                Directionality.of(context) == TextDirection.ltr
                                    ? null
                                    : 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppWidth.w8,
                                vertical: AppHeight.h4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsManager.redColor,
                                borderRadius:
                                    Directionality.of(context) ==
                                            TextDirection.rtl
                                        ? BorderRadius.only(
                                          topLeft: Radius.circular(
                                            AppRadius.r4,
                                          ),
                                          bottomLeft: Radius.circular(
                                            AppRadius.r4,
                                          ),
                                        )
                                        : BorderRadius.only(
                                          topRight: Radius.circular(
                                            AppRadius.r4,
                                          ),
                                          bottomRight: Radius.circular(
                                            AppRadius.r4,
                                          ),
                                        ),
                              ),
                              child: Text(
                                AppStrings.sale(context: context),
                                style: TextStyles.font10Bold.copyWith(
                                  color: ColorsManager.white,
                                ),
                              ),
                            ),
                          )
                          : SizedBox.shrink(),

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
                AutoSizeText(
                  "Men’s Watch ",
                  style: TextStyles.font14Bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  "X FashionX Fashion",
                  style: TextStyles.font14Regular.copyWith(
                    color: ColorsManager.greyColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                ProductRating(),
                Row(
                  spacing: AppWidth.w12,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        "\$28.56", // current price
                        style: TextStyles.font14Semi,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Flexible(
                      child: AutoSizeText(
                        "\$45.00", // original price before sale
                        style: TextStyles.font12Regular.copyWith(
                          color: ColorsManager.greyColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: ColorsManager.greyColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                CounterAddToCartWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
