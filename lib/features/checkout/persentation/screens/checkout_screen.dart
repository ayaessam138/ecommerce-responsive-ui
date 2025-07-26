
import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/helpers/app_values.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:client/features/cart/persentation/widgets/payment_summary_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/paymob_helper.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';
import '../widgets/payment_methods_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppbarWidget(title: AppStrings.checkout(context: context)),
            Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p16),

                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: AppHeight.h20,
                    children: [
                      PaymentMethods(),
                      PaymentSummary(),
                    ],
                  ),
                ),
              ),
            ),

            Divider(height: AppHeight.h1,thickness: 1),
            Padding(
              padding: EdgeInsets.all(AppPadding.p20),
              child: AppButton(
                title: "${AppStrings.pay(context: context)} \$44",
                onTap: () async{

                  final pay = PaymobPayment();
                  var reponse = await pay.startPayment();
                  final checkoutUrl =
                      'https://accept.paymob.com/unifiedcheckout/?publicKey=${pay.publicKey}&clientSecret=${reponse.data["client_secret"]}';

                 if(mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckoutWebView(url: checkoutUrl),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
