import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/features/profile/persentation/widgets/notifications/notication_listview_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_values.dart';

class NotificationListviewWidget extends StatelessWidget {
  const NotificationListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppPadding.p16),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return NotificationListviewItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.vertical(AppHeight.h16);
      },
    );
  }
}
