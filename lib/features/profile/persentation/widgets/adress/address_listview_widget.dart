

import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_images.dart';
import '../../../../../core/helpers/app_spacing.dart';
import '../../../../../core/helpers/app_values.dart';
import 'adress_listview_item_widget.dart';

class AddressListviewWidget extends StatelessWidget {
  const AddressListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w16),
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AddressListviewItemWidget(
            addressType: 'Home Adress',
            address: '8502 Preston Rd. Inglewood, Maine 98380, USA',
            addressIcon: AppImages.homeAddressIcon,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return AppSpace.vertical(AppHeight.h16);
        },
      ),
    );
  }
}
