import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:client/features/product/persentation/widgets/products/product_horizontal_listview_item_widget.dart';
import 'package:flutter/material.dart';

class HomeProductListviewWidget extends StatelessWidget {
  const HomeProductListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) {
          return Padding(
            padding: EdgeInsets.only(right: AppWidth.w12),
            child: ProductHorizontalListViewItemWidget(

              onTap: () {
                AppNavigator.pushNamed(context, AppRoutes.productDetailsRoute);
              },
            ),
          );
        }),
      ),
    );
  }
}
