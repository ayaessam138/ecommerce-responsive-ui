import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/core/widgets/app_text_field.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';
import '../widgets/product_in_review_widget.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWidget(title: AppStrings.productReview(context: context)),
            Expanded(
              flex: 12,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    spacing: AppHeight.h12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        AppStrings.howIsYourProduct(context: context),
                        style: TextStyles.font16Semi,
                      ),

                      ProductInReviewWidget(),
                      AutoSizeText(
                        AppStrings.overAllRating(context: context),
                        style: TextStyles.font16Semi,
                      ),
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        // itemSize: 22.sp,
                        // itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                        itemBuilder:
                            (context, _) =>
                                Icon(Icons.star, color: ColorsManager.yellow),
                        onRatingUpdate: (rating) {
                 
                        },
                      ),

                      AutoSizeText(
                        AppStrings.reviewDetails(context: context),
                        style: TextStyles.font16Semi,
                      ),
                      AppTextField(validator: (val) {}, maxLines: 4),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: AppHeight.h1),
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: AppButton(
                title: AppStrings.submitReview(context: context),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
