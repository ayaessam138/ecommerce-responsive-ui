import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_images.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/theming/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RangeSliderWidget extends StatefulWidget {
  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.always,
          rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.blue, // اللون لو تحب تغيّره
          valueIndicatorTextStyle: TextStyle(color: Colors.white),
        ),
        child: RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
      ),
    );
  }
}



class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _rangeValues = const RangeValues(30, 70);

  @override
  Widget build(BuildContext context) {
    const double min = 0;
    const double max = 100;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppWidth.w12,
        vertical: AppHeight.h32,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double trackWidth = constraints.maxWidth;
          final double thumbRadius = 10.r; // تقريبي حسب التصميم

          double startPercent = (_rangeValues.start - min) / (max - min);
          double endPercent = (_rangeValues.end - min) / (max - min);

          double startX = startPercent * trackWidth;
          double endX = endPercent * trackWidth;

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // مؤشر البداية فوقه أيقونة ورقم
              Positioned(
                left: startX - 5.w, // نصف عرض الأيقونة تقريبًا
                bottom: 65.h,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppImages.sliderIcon,
                      width: 35.w,
                      height: 35.h,
                      color: ColorsManager.black,
                    ),
                    SizedBox(height: 4.h),
                    AutoSizeText(
                      _rangeValues.start.round().toString(),
                      style: TextStyles.font14Medium.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              // مؤشر النهاية فوقه أيقونة ورقم
              Positioned(
                left: endX - 30.w,
                bottom: 65.h,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppImages.sliderIcon,
                      width: 35.w,
                      height: 35.h,
                      color: ColorsManager.black,
                    ),
                    SizedBox(height: 4.h),
                    AutoSizeText(
                      _rangeValues.end.round().toString(),
                      style: TextStyles.font14Medium.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              // السلايدر نفسه
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  rangeThumbShape: const RoundRangeSliderThumbShape(enabledThumbRadius: 10),
                  rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
                  rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
                  valueIndicatorColor: ColorsManager.mainColor,
                  showValueIndicator: ShowValueIndicator.never,
                ),
                child: RangeSlider(
                  activeColor: ColorsManager.mainColor,
                  values: _rangeValues,
                  min: min,
                  max: max,
                  divisions: 10,
                  onChanged: (values) {
                    setState(() {
                      _rangeValues = values;
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


