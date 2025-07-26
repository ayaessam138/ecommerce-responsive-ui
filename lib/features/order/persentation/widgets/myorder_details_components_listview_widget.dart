import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacing.dart' show AppSpace;
import '../../../../core/helpers/app_values.dart' show AppHeight, AppWidth;
import 'my_order_deatils_components_listview_item_widget.dart';

class MyOrderDetailsComponentsListviewWidget extends StatelessWidget {
  const MyOrderDetailsComponentsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppWidth.w16,
        vertical: AppHeight.h3,
      ),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MyOrderDetailsComponentsListviewItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.vertical(AppHeight.h16);
      },
    );
  }
}
