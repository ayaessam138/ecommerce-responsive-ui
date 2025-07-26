import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/all_product_offers_listview_widget.dart';

class AllOfferProductsScreen extends StatelessWidget {
  const AllOfferProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: AppHeight.h16,
          children: [
            AppbarWidget(title: "Offers"),
            Expanded(child: AllOffersProductListviewWidget()),
          ],
        ),
      ),
    );
  }
}
