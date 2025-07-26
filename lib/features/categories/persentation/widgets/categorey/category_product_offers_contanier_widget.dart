import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/widgets/dots_indicator_widget.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/app_values.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryProductOffersContanierWidget extends StatefulWidget {
  const CategoryProductOffersContanierWidget({super.key});

  @override
  State<CategoryProductOffersContanierWidget> createState() =>
      _CategoryProductOffersContanierWidgetState();
}

class _CategoryProductOffersContanierWidgetState
    extends State<CategoryProductOffersContanierWidget> {
  int currentIndex = 0;

  List<String> images = [
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: AppHeight.fullHeight(context) * .20,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      items:
          images.asMap().entries.map((entry) {
            int i = entry.key;
            String image = entry.value;

            return Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height*.2,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
          
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    border: Border.all(color: ColorsManager.lightGreyColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    child: Image.asset(
                      height:
                          AppHeight.fullHeight(context) *
                          .20, // نفس ارتفاع الكاروسيل
                      fit: BoxFit.cover, // ✅ مهم جداً
                      image,
                      width: AppWidth.fullWidth(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(images.length, (dotIndex) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.sp),
                        child: DotsIndicator(
                          isActive: currentIndex == dotIndex,
                          activeColor: ColorsManager.white,
                          inactiveColor: ColorsManager.lightGreyColor
                              .withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 10.sp,
                  left: 20.sp,
                  width: AppWidth.fullWidth(context) * .2,
                  child: Column(
                    spacing: AppHeight.h6,
                    children: [
                      AutoSizeText(
                        "🚀 24-Hour Deal🚀 ",
                        maxLines: 2,
                        style: TextStyles.font16Bold.copyWith(
                          color: ColorsManager.white,
                        ),
                      ),
                      AutoSizeText(
                        "Grab 40% OFF Before Time Runs Out! ",
                        maxLines: 3,
                        style: TextStyles.font16Regular.copyWith(
                          color: ColorsManager.white,
                        ),
                      ),
                      AppButton(
                        horizontalPadding: AppWidth.w6,
                        verticalPadding: AppHeight.h3,
                        title: "ShopNow",
                        // buttonTextcolor: ColorsManager.black,
                        onTap: () {},
                        buttoncolor: ColorsManager.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}
