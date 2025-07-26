import 'package:client/core/helpers/app_values.dart';

import 'package:flutter/material.dart';

import 'all_products_offer_listview_item_widget.dart';

class AllOffersProductListviewWidget extends StatelessWidget {
  const AllOffersProductListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(AppPadding.p16),
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 44,
      itemBuilder: (context, index) {
        return AllProductsOfferListviewItemWidget();
      },
    );
  }
}
