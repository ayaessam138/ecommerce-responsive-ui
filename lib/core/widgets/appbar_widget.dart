import 'dart:math' as math;

import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/styles.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget({
    super.key,
    required this.title,
    this.showArrow = true,
    this.showIcon = false,
  });
  final String title;
  bool showArrow;
  bool showIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:showArrow?0: AppWidth.w30,
            vertical: showArrow?0:AppHeight.h20,
          ),
          child: Row(
            children: [
              Row(
                children: [
                  showArrow
                      ? InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: AppWidth.w30,vertical: 18.h),
                          child: Transform.rotate(
                            angle:
                                context.locale.languageCode == "en"
                                    ? 0
                                    : math.pi,
                            child: SvgPicture.asset(AppImages.arrowIcon, width: AppWidth.w12,),
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                  Text(title, style: TextStyles.font20Bold),
                ],
              ),
              Spacer(),
              showIcon
                  ? GestureDetector(
                    onTap: () {
                      AppNavigator.pushNamed(context, AppRoutes.searchRoute);
                    },
                    child: Icon(Icons.search),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        Divider(height: AppHeight.h1),
      ],
    );
  }
}
