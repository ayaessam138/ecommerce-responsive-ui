import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/notifications/notification_listview_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.notifications(context: context)),
            Expanded(child: NotificationListviewWidget())
          ],
        ),
      ),
    );
  }
}
