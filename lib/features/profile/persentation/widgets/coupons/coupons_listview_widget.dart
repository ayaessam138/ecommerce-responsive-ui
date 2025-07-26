

import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_spacing.dart';
import '../../../../../core/helpers/app_values.dart';
import 'coupons_listview_item_widget.dart';

class CouponsListviewWidget extends StatelessWidget {
  const CouponsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal:AppWidth.w16 ),
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CouponsListviewItemWidget();
        }, separatorBuilder: (BuildContext context, int index) { return AppSpace.vertical(AppHeight.h16); },
      ),
    );
  }
}
