import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/coupons/coupons_listview_widget.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.coupons(context: context)),
            AppSpace.vertical(AppHeight.h16),
            CouponsListviewWidget(),
          ],
        ),
      ),
    );
  }
}
