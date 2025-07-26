import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/theming/colors.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/order/persentation/widgets/cancel_return_order_buttons.dart';
import 'package:client/features/order/persentation/widgets/myorder_details_help_widget.dart';
import 'package:client/features/order/persentation/widgets/myorder_details_components_listview_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../widgets/myorder_details_addres_widget.dart';
import '../widgets/myorder_summary_widget.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  const MyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              AppbarWidget(title: AppStrings.myOrderDetails(context: context)),
              Padding(
                padding: EdgeInsets.all(AppPadding.p16),
                child: Column(
                  spacing: AppHeight.h16,
                  children: [
                    Container(
                      // padding:EdgeInsets.all(AppPadding.p16),
                      width: AppWidth.fullWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r8),
                        border: Border.all(color: ColorsManager.lightGreyColor),
                      ),
                      child: Column(
                        spacing: AppHeight.h4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(AppPadding.p16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "Order #RS23454",
                                  style: TextStyles.font16Regular.copyWith(
                                    color: ColorsManager.darkGreyColor,
                                  ),
                                ),
                                AutoSizeText(
                                  "Placed on 10 Dec, 2024",
                                  style: TextStyles.font16Semi,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: AppHeight.h1,
                            color: ColorsManager.lightGreyColor,
                          ),
                          SizedBox( height:AppHeight.fullHeight(context)*.25,child: MyOrderDetailsComponentsListviewWidget()),
                        ],
                      ),
                    ),
                    MyOrderDetailsAddressWidget(),
                    MyOrderSummary(),
                    MyOrderDetailsHelpWidget(),

                  ],
                ),
              ),
              Divider(height: AppHeight.h1,),
              CancelReturnOrderButtons()
            ],
          ),
        ),
      ),
    );
  }
}


