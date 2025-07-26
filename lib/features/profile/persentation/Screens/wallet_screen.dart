import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/wallet/transactions_listview_widget.dart';
import '../widgets/wallet/wallet_header_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
         AppbarWidget(title:  AppStrings.wallet(context: context),),
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppHeight.h16,
                children: [
                  WalletHeaderWidget(),
                  AutoSizeText(
                    AppStrings.transcationHistory(context: context),
                    style: TextStyles.font18Bold,
                  ),
                ],
              ),
            ),
            Expanded(child: TransactionsListviewWidget()),
          ],
        ),
      ),
    );
  }
}
