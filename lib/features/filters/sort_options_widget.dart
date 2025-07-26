
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/check_listtile_widget.dart';

class CategoriesSortOptionWidget extends StatefulWidget {
  const CategoriesSortOptionWidget({super.key});

  @override
  State<CategoriesSortOptionWidget> createState() =>
      _CategoriesSortOptionWidgetState();
}

class _CategoriesSortOptionWidgetState
    extends State<CategoriesSortOptionWidget> {
  late final List<String> filters;
  late List<bool> selected;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    filters = [
      AppStrings.priceHighToLow(context: context),
      AppStrings.priceLowToHigh(context: context),
      AppStrings.aToZ(context: context),
      AppStrings.zToA(context: context),
      AppStrings.newItem(context: context),
      AppStrings.highestToLowestRating(context: context),
      AppStrings.lowestToHighestRating(context: context),
    ];
    selected = List.generate(filters.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(filters.length, (index) {
        return Column(
          children: [
            CheckboxItem(
              title: filters[index],
              value: selected[index],
              onChanged: (bool? val) {
                setState(() {
                  // مسح كل الاختيارات
                  for (int i = 0; i < selected.length; i++) {
                    selected[i] = false;
                  }
                  // تفعيل الاختيار الحالي لو val true
                  selected[index] = val ?? false;
                });
              },
            ),
            Divider(height: AppHeight.h1, color: ColorsManager.lightGreyColor),
          ],
        );
      }),
    );
  }
}
