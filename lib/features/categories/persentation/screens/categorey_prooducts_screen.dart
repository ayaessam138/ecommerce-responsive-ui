import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/categories/persentation/widgets/categoreyproduct/category_product_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/categorey/category_product_offers_contanier_widget.dart';
import '../../../filters/product_sortfilter_widget.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  AppbarWidget(title: "Men"),
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      spacing: AppHeight.h12,
                      children: [
                        AppTextField(
                          suffixIcon: Icon(
                            Icons.search,
                            color: ColorsManager.black,
                          ),
                          validator: (val) {},
                          hintText: AppStrings.search(context: context),
                          hintStyle: TextStyles.font16Regular.copyWith(
                            color: ColorsManager.greyColor,
                          ),
                        ),
                        CategoryProductOffersContanierWidget(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AutoSizeText(
                                  AppStrings.showingResult(context: context),
                                  style: TextStyles.font16Semi.copyWith(
                                    color: ColorsManager.greyColor,
                                  ),
                                ),
                                SizedBox(width: AppWidth.w6),
                                AutoSizeText(
                                  "135",
                                  style: TextStyles.font16Semi,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isGridView = !isGridView;
                                });
                              },
                              child: SvgPicture.asset(AppImages.gridviewIcon),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CategoryProductsListviewWidget(isGridView: isGridView),
                  SizedBox(height: 75.h),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IgnorePointer(
                ignoring: MediaQuery.of(context).viewInsets.bottom > 0,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: MediaQuery.of(context).viewInsets.bottom > 0 ? 0 : 1,
                  child: ProductSortFilterWidget(),
                ),
              ),
            ),

            // ProductSortFilterWidget(),
          ],
        ),
      ),
    );
  }
}

// class CategoryProductsScreen extends StatelessWidget {
//   const CategoryProductsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               spacing: AppHeight.h16,
//               children: [
//                 AppbarWidget(title: "shoes"),
//                 Padding(
//                   padding: EdgeInsets.all(AppPadding.p16),
//                   child: Column(
//                     spacing: AppHeight.h12,
//                     children: [
//                       AppTextField(
//                         suffixIcon: Icon(
//                           Icons.search,
//                           color: ColorsManager.black,
//                         ),
//                         validator: (val) {},
//                         hintText: AppStrings.search(context: context),
//                         hintStyle: TextStyles.font16Regular.copyWith(
//                           color: ColorsManager.greyColor,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             spacing: AppWidth.w6,
//                             children: [
//                               AutoSizeText(
//                                 AppStrings.showingResult(context: context),
//                                 style: TextStyles.font16Semi.copyWith(
//                                   color: ColorsManager.greyColor,
//                                 ),
//                               ),
//                               AutoSizeText("135", style: TextStyles.font16Semi),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {},
//                             child: SvgPicture.asset(AppImages.gridviewIcon),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 CategoryProductsListviewWidget(),
//               ],
//             ),
//             CategoryProductSortFilterWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
