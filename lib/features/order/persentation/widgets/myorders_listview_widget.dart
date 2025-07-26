import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_values.dart';
import 'my_order_listview_item_widget.dart';

class MyOrdersListviewWidget extends StatelessWidget {
  const MyOrdersListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(AppPadding.p16),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MyOrderListviewItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.vertical(AppHeight.h16);
      },
    );
  }
}
