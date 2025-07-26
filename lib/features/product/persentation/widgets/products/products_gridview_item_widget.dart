import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/helpers/app_images.dart';
import '../../../../../../core/helpers/app_strings.dart';
import '../../../../../../core/helpers/app_values.dart';
import '../../../../../../core/theming/colors.dart';
import '../../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/counter_add_to_cart_widget.dart';
import '../../../../../core/widgets/product._rating.dart';

class ProductGridviewItemWidget extends StatelessWidget {
  const ProductGridviewItemWidget({
    super.key,
    this.showCompare = true,
    this.isOnSale = true,
  });
  final bool showCompare;
  final bool isOnSale;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNamed(context, AppRoutes.productDetailsRoute);
      },
      child: Column(
        spacing: AppHeight.h12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                // color: ColorsManager.redColor,
                width: AppWidth.fullWidth(context),
                child: Image.asset(AppImages.product,fit: BoxFit.fill,),
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
          Column(
            spacing: AppHeight.h6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Men’s Watch",
                style: TextStyles.font14Bold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ProductRating(),
              AutoSizeText(
                "X Fashion",
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
      ),
    );
  }
}

// class OffersProductListviewItemWidget extends StatelessWidget {
//   const OffersProductListviewItemWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: AppWidth.fullWidth(context)*.8,
//       child: Padding(
//         padding:  EdgeInsets.only(right: AppWidth.w8),
//         child: Row(
//           spacing: AppHeight.h10,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 2,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(AppRadius.r12),
//                 child: Stack(
//                   children: [
//                     SvgPicture.asset(
//                       AppImages.emptyOrderHistory,
//                       // fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                       right: AppHeight.h15,
//                       top: AppHeight.h12,
//                       child: SvgPicture.asset(AppImages.favIcon),
//                     ),
//                     Positioned(
//                       top: AppHeight.h12,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: AppWidth.w8,
//                           vertical: AppHeight.h4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: ColorsManager.redColor,
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(AppRadius.r4),
//                             bottomRight: Radius.circular(AppRadius.r4),
//                           ),
//                         ),
//                         child: Text(
//                           AppStrings.sale(context: context),
//                           style: TextStyles.font10Bold.copyWith(
//                             color: ColorsManager.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Column(
//                 spacing: AppHeight.h6,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AutoSizeText(
//                     "Men’s Watch ",
//                     style: TextStyles.font14Bold,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   AutoSizeText(
//                     "X Fashion",
//                     style: TextStyles.font14Regular.copyWith(
//                       color: ColorsManager.greyColor,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                   Row(
//                     spacing: AppWidth.w8,
//                     children: [
//                       AutoSizeText(
//                         "\$28.56", // current price
//                         style: TextStyles.font14Semi,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//
//                       AutoSizeText(
//                         "\$45.00", // original price before sale
//                         style: TextStyles.font12Regular.copyWith(
//                           color: ColorsManager.greyColor,
//                           decoration: TextDecoration.lineThrough,
//                           decorationColor: ColorsManager.greyColor,
//                         ),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     spacing: AppWidth.w12,
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: AppWidth.w8,
//                             vertical: AppHeight.h10,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(AppRadius.r8),
//                             border: Border.all(color: ColorsManager.greyColor),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             spacing: AppHeight.h3,
//                             children: [
//                               Expanded(child: SvgPicture.asset(AppImages.decrementIcon)),
//                                 Flexible(child: AutoSizeText("1", style: TextStyles.font16Semi,maxLines: 1,)),
//                               Expanded(child: SvgPicture.asset(AppImages.incrementIcon)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: AppWidth.w12,
//                             vertical: AppHeight.h10,
//                           ),
//                           decoration: BoxDecoration(
//                             color: ColorsManager.mainColor,
//                             borderRadius: BorderRadius.circular(AppRadius.r8),
//                           ),
//                           child: SvgPicture.asset(
//                             AppImages.cartIcon,
//                             color: ColorsManager.white,
//                             // height: AppHeight.h40,
//                             width: AppWidth.w20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
