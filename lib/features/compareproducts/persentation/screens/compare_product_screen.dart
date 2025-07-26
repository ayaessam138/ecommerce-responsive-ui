
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/compareproducts/persentation/widgets/compare_products_gridview_widget.dart';
import 'package:flutter/material.dart';

class CompareProductScreen extends StatelessWidget {
  const CompareProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.compareProducts(context:context)),
            Expanded(child: CompareProductsGridviewWidget())
          ],
        ),
      ),
    );
  }
}
