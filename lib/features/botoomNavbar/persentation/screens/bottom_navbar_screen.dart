import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      buildWhen: (previous, current) => current is BottomNavBarChangeIndex,
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: ColorsManager.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.lightGreyColor.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CurvedNavigationBar(
                  buttonBackgroundColor: ColorsManager.mainColor,
                  backgroundColor: Colors.transparent,
                  color: ColorsManager.white,
                  animationCurve: Curves.easeIn,
                  index: cubit.currentIndex,
                  items: [
                    SvgPicture.asset(
                      AppImages.homeIcon,
                      color:
                          cubit.currentIndex == 0
                              ? ColorsManager.white
                              : ColorsManager.greyColor,
                    ),
                    SvgPicture.asset(
                      AppImages.salesIcon,
                      color:
                          cubit.currentIndex == 1
                              ? ColorsManager.white
                              : ColorsManager.greyColor,
                    ),
                    SvgPicture.asset(
                      AppImages.userIcon,
                      color:
                          cubit.currentIndex == 2
                              ? ColorsManager.white
                              : ColorsManager.greyColor,
                    ),
                  ],
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                ),
              ),
              Positioned(
                bottom: 3.sp,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppStrings.main(context: context),
                      style: TextStyles.font14Regular.copyWith(
                        color:
                            cubit.currentIndex == 0
                                ? ColorsManager.mainColor
                                : null,
                      ),
                    ),
                    Text(
                      AppStrings.sales(context: context),
                      style: TextStyles.font14Regular.copyWith(
                        color:
                        cubit.currentIndex == 1
                            ? ColorsManager.mainColor
                            : null,
                      ),
                    ),
                    Text(
                      AppStrings.profile(context: context),
                      style: TextStyles.font14Regular.copyWith(
                        color:
                        cubit.currentIndex == 2
                            ? ColorsManager.mainColor
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//
// import 'package:ecommerce/core/theming/colors.dart';
// import 'package:ecommerce/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../core/helpers/app_images.dart';
// import '../../../../core/theming/styles.dart';
//
// class BottomNavBarScreen extends StatelessWidget {
//   BottomNavBarScreen({super.key});
//
//   NotchBottomBarController notchBottomBarController =
//   NotchBottomBarController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
//       buildWhen: (previous, current) => current is BottomNavBarChangeIndex,
//       builder: (context, state) {
//         var cubit = BottomNavBarCubit.get;
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           floatingActionButtonLocation:
//           FloatingActionButtonLocation.centerDocked,
//           body: cubit.pages[cubit.currentIndex],
//           bottomNavigationBar: AnimatedNotchBottomBar(
//             onTap: (index) {
//               cubit.changeIndex(index);
//             },
//             showLabel: true,
//
//             bottomBarItems: [
//               BottomBarItem(
//                 itemLabel: "home",
//
//                 inActiveItem: SvgPicture.asset(
//                   AppImages.homeIcon,
//                   color: ColorsManager.ColorsManager.mainColor,
//                 ),
//                 activeItem: SvgPicture.asset(AppImages.homeIcon),
//               ) ,BottomBarItem(
//                 inActiveItem: SvgPicture.asset(
//                   AppImages.homeIcon,
//                   color: ColorsManager.ColorsManager.mainColor,
//                 ),
//                 activeItem: SvgPicture.asset(AppImages.homeIcon),
//               ) ,BottomBarItem(
//                 inActiveItem: SvgPicture.asset(
//                   AppImages.homeIcon,
//                   color: ColorsManager.ColorsManager.mainColor,
//                 ),
//                 activeItem: SvgPicture.asset(AppImages.homeIcon),
//               ) ,BottomBarItem(
//                 inActiveItem: SvgPicture.asset(
//                   AppImages.homeIcon,
//                   color: ColorsManager.ColorsManager.mainColor,
//                 ),
//                 activeItem: SvgPicture.asset(AppImages.homeIcon),
//               ),
//             ],
//             notchBottomBarController: notchBottomBarController,
//             kIconSize: 30.sp,
//             kBottomRadius: 12.r,
//           ),
//         );
//       },
//     );
//   }
// }
