import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/myorders_listview_widget.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.myOrders(context: context)),
            Expanded(child: MyOrdersListviewWidget()),
          ],
        ),
      ),
    );
  }
}
