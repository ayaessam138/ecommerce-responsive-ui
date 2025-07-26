
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:client/features/categories/persentation/widgets/categorey/categories_gridview_widget.dart';
import 'package:client/features/home/persentation/widgets/home_list_title_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/home_product_listview_widget.dart';
import '../widgets/flash_sale_container_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/home_offer_slider_widget.dart';
import '../widgets/new_lanched_contanier_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p16),
            child: Column(
              spacing: AppHeight.h16,
              children: [
                HomeHeaderWidget(),
                GestureDetector(
                  onTap: () {
                    AppNavigator.pushNamed(context, AppRoutes.searchRoute);
                  },
                  child: AppTextField(
                    enabled: false,
                    suffixIcon: Icon(Icons.search, color: ColorsManager.black),
                    validator: (val) {},
                    hintText: AppStrings.search(context: context),
                    hintStyle: TextStyles.font16Regular.copyWith(
                      color: ColorsManager.greyColor,
                    ),
                  ),
                ),

                HomeOfferSliderWidget(),
                HomeListTitleWidget(
                  title: AppStrings.categories(context: context),
                  onTap: () {
                    print("object");
                    AppNavigator.pushNamed(
                      context,
                      AppRoutes.allCategoriesRoute,
                    );
                  },
                ),

                SizedBox(
                  // height: AppHeight.fullHeight(context) * .3,
                  child: CategoriesGridviewWidget(),
                ),
                HomeListTitleWidget(
                  title: AppStrings.salesProducts(context: context),
                  onTap: () {
                    AppNavigator.pushNamed(context, AppRoutes.allProductsRoute);
                  },
                ),
                HomeProductListviewWidget(),
                FlashSaleContainerWidget(),
                HomeListTitleWidget(
                  title: AppStrings.popularProducts(context: context),
                  onTap: () {
                    AppNavigator.pushNamed(context, AppRoutes.allProductsRoute);
                  },
                ),

                HomeProductListviewWidget(),
                NewLanchedContanierWidget(),
                HomeListTitleWidget(
                  title: AppStrings.newlyLaunched(context: context),
                  onTap: () {
                    AppNavigator.pushNamed(context, AppRoutes.allProductsRoute);
                  },
                ),
                HomeProductListviewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
