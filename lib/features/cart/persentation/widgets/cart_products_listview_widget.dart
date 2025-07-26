
import 'package:client/core/helpers/app_spacing.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/features/cart/persentation/widgets/cart_products_listview_item_widget.dart';
import 'package:flutter/material.dart';


class CartProductsListviewWidget extends StatelessWidget {
  const CartProductsListviewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CartProductsListviewItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.vertical(AppHeight.h12);
      },
    );
  }
}
