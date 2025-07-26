
import 'package:client/features/profile/persentation/widgets/wallet/transaction_listview_item_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/app_spacing.dart';
import '../../../../../core/helpers/app_values.dart';

class TransactionsListviewWidget extends StatelessWidget {
  const TransactionsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(AppPadding.p16),
      itemCount: 53,
      shrinkWrap: true,
      itemBuilder: (context, index) {
     return  TransactionListviewItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return AppSpace.vertical(AppHeight.h16);
      },
    );
  }
}
