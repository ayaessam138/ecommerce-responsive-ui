import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../filters/sortfilter_bottom_sheet_widget.dart';
import '../../../home/persentation/widgets/home_offer_slider_widget.dart';
import '../widgets/offer_products_gridview_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              AppbarWidget(
                title: AppStrings.sale(context: context),
                showIcon: true,
                showArrow: false,
              ),
              Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppHeight.h12,
                  children: [
                    HomeOfferSliderWidget(),

                    // HomeListTitleWidget(
                    //   title: AppStrings.categories(context: context),
                    //   onTap: () {
                    //     AppNavigator.pushNamed(
                    //       context,
                    //       AppRoutes.allCategoriesRoute,
                    //     );
                    //   },
                    // ),

                    // SizedBox(
                    //   height: AppHeight.fullHeight(context) * .15,
                    //   child: OffersCategoryListviewWidget(),
                    // ),
                    Row(
                      spacing: AppWidth.w16,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showBottomSheetCategorySortFilter(context, 0);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p8,
                                horizontal: AppPadding.p8,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsManager.moreLightGreyColor,
                                borderRadius: BorderRadius.circular(
                                  AppRadius.r8,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: AppWidth.w6,
                                children: [
                                  AutoSizeText(
                                    AppStrings.sort(context: context),
                                    style: TextStyles.font16Bold,
                                  ),
                                  SvgPicture.asset(
                                    AppImages.sortIcon,
                                    height: 18.h,
                                    width: 18.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showBottomSheetCategorySortFilter(context, 1);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p8,
                                horizontal: AppPadding.p8,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsManager.moreLightGreyColor,
                                borderRadius: BorderRadius.circular(
                                  AppRadius.r8,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: AppWidth.w6,

                                children: [
                                  AutoSizeText(
                                    AppStrings.filter(context: context),
                                    style: TextStyles.font16Bold,
                                  ),
                                  SvgPicture.asset(
                                    AppImages.filterIcon,
                                    height: 18.h,
                                    width: 18.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: AppHeight.h1),
                  ],
                ),
              ),
              OffersProductGridviewWidget(),
              AppSpace.vertical(AppHeight.h12)
            ],
          ),
        ),
      ),
    );
  }
}

// HomeListTitleWidget(
//   title: AppStrings.products(context: context),
//   onTap: () {},
// ),
// OffersProductListviewWidget(),
// HomeListTitleWidget(
//   title: AppStrings.products(context: context),
//   onTap: () {},
// ),
// OffersProductListviewWidget(),
// HomeListTitleWidget(
//   title: AppStrings.products(context: context),
//   onTap: () {},
// ),
// OffersProductListviewWidget(),***
