import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import 'offers_category_listview_item_widget.dart';

class OffersCategoryListviewWidget extends StatelessWidget {
  OffersCategoryListviewWidget({super.key});

  final List<Color> colorList = [
    ColorsManager.mainColor,
    ColorsManager.darkRed,
    ColorsManager.yellow,
    ColorsManager.minitGreenColor,
    ColorsManager.pink,
    ColorsManager.purple,
    ColorsManager.white,
    ColorsManager.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,

      shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
      itemCount: colorList.length,

      itemBuilder: (context, index) {
        return OffersCategoryListviewItemWidget(
          categoryColor: colorList[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.horizontal(AppWidth.w8);
      },
    );
  }
}
