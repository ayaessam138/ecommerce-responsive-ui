
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/cart/persentation/widgets/cart_products_listview_widget.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:flutter/material.dart';
import '../widgets/apply_coupon_widget.dart';
import '../widgets/payment_summary_widget.dart';
import '../widgets/cart_user_info_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              AppbarWidget(title: AppStrings.cart(context: context)),
              Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppHeight.fullHeight(context) * .35,
                      child: CartProductsListviewWidget(),
                    ),
                    AppSpace.vertical(AppHeight.h16),
                    CartUserInfo(),
                    AppSpace.vertical(AppHeight.h16),

                    ApplyCouponWidget(),
                    PaymentSummary(),
                  ],
                ),
              ),

              Divider(height: AppHeight.h1),
              Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: AppButton(
                  title: AppStrings.processToCheckOut(context: context),
                  onTap: () async {
                    AppNavigator.pushNamed(context, AppRoutes.checkoutRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
