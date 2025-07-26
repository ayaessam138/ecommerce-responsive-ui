import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';
import 'package:client/features/emptysecreens/widgets/empty_screen_button.dart';
import 'package:client/core/widgets/dots_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_values.dart';

class HomeOfferSliderWidget extends StatefulWidget {
  const HomeOfferSliderWidget({super.key});

  @override
  State<HomeOfferSliderWidget> createState() => _HomeOfferSliderWidgetState();
}

class _HomeOfferSliderWidgetState extends State<HomeOfferSliderWidget> {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    border: Border.all(color: ColorsManager.lightGreyColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    child: Image.asset(
                      image,
                      width: AppWidth.fullWidth(context),
                      fit: BoxFit.cover,
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
                  bottom: 20.sp,
                  right: 50.sp,
                  width: AppWidth.fullWidth(context) * .2,
                  child: Column(
                    children: [
                      AutoSizeText(
                        "🎉 Mega Sale! 🎉Up to 50% OFF ",
                        maxLines: 4,
                        style: TextStyles.font18Bold.copyWith(
                          color: ColorsManager.black,
                        ),
                      ),
                      AppButton(
                        title: "ShopNow",
                        buttonTextcolor: ColorsManager.black,
                        onTap: () {},
                        buttoncolor: ColorsManager.yellow,
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
