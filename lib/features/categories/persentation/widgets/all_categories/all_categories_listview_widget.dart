
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:flutter/material.dart';
import 'all_categories_listview_item_widget.dart';

class AllCategoriesListviewWidget extends StatelessWidget {
  const AllCategoriesListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppPadding.p16),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 22,
      itemBuilder: (context, index) {
        return AllCategoriesListviewItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.vertical(AppHeight.h16);
      },
    );
  }
}
