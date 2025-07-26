import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/dots_indicator_widget.dart';

class ProductPhotoSlider extends StatefulWidget {
  const ProductPhotoSlider({super.key});

  @override
  State<ProductPhotoSlider> createState() => _ProductPhotoSliderState();
}

class _ProductPhotoSliderState extends State<ProductPhotoSlider> {
  final List<String> photosList = [
    AppImages.product,
    AppImages.product,
    AppImages.product,
  ];
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Stack for slider + dots
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Slider
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.lightGreyColor),
                borderRadius: BorderRadius.circular(AppRadius.r8),
              ),
              height: AppHeight.fullHeight(context) * .3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: photosList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    child: Image.asset(photosList[index], fit: BoxFit.fill),
                  );
                },
              ),
            ),
            // Dots Indicator
            Positioned(
              bottom: AppHeight.h10,
              child: Row(
                children: List.generate(photosList.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWidth.w2),
                    child: DotsIndicator(
                      isActive: currentIndex == index,
                      activeColor: ColorsManager.mainColor,
                      inactiveColor: ColorsManager.greyColor,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),

        SizedBox(height: AppHeight.h10),

        // Photos ListView
        SizedBox(
          height: AppHeight.fullHeight(context) * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photosList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: AppWidth.w4),
                  //                  padding: EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          currentIndex == index
                              ? ColorsManager.mainColor
                              : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                    child: Image.asset(
                      photosList[index],
                      width: AppWidth.fullWidth(context) * .3,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
