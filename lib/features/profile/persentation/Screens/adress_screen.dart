import 'package:client/core/routing/app_routes.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart' show AppHeight;
import '../../../../core/theming/colors.dart' show ColorsManager;
import '../widgets/adress/address_listview_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.mainColor,
        onPressed: () {
          AppNavigator.pushNamed(context, AppRoutes.addAddressRoute);
        },
        child: Icon(Icons.add, color: ColorsManager.white),
      ),
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.manageAddress(context: context)),
            AppSpace.vertical(AppHeight.h16),
            AddressListviewWidget(),
          ],
        ),
      ),
    );
  }
}
