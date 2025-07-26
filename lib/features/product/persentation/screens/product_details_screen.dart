
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/product_details/product_details_widget.dart';
import '../widgets/product_details/product_photos_slider_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: "Bold Elegant Dress"),
            Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    spacing: AppHeight.h16,
                    children: [ProductPhotoSlider(), ProductDetailsWidget()],
                  ),
                ),
              ),
            ),
            Divider(height: AppHeight.h1),
            Padding(
              padding: EdgeInsets.only(
                top: AppPadding.p12,
                left: AppPadding.p12,
                right: AppPadding.p12,
                bottom: 6.sp
              ),
              child: AppButton(
                title: AppStrings.addToCart(context: context),
                width: AppWidth.fullWidth(context),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
