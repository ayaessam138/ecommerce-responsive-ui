import 'package:client/core/helpers/app_strings.dart';
import 'package:client/core/widgets/appbar_widget.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../routing/app_routes.dart';

class PaymobPayment {
  final Dio dio = Dio();

  final String secretKey =
      'egy_sk_test_84525fd403cf3d4a4d8ef47494bd507f160eec77cbf3bdafc5c8039e160193f0';
  final String publicKey = 'egy_pk_test_N7cPFGthfp2MzxC9oStrtcezrY6VHefE';
  final int integrationId = 5129169; // card integration ID
  // final String redirectionUrl = 'https://yourdomain.com/payment-result';

  Future<Response> startPayment() async {
    const String intentionUrl = 'https://accept.paymob.com/v1/intention/';

    final Map<String, dynamic> requestBody = {
      "amount": 10000,
      "currency": "EGP",
      "payment_methods": [integrationId],
      // "redirection_url": redirectionUrl,
      "billing_data": {
        "first_name": "Ahmed",
        "last_name": "Ali",
        "email": "ahmed@example.com",
        "phone_number": "+201234567890",
        "country": "EG",
      },
    };

    try {
      final response = await dio.post(
        intentionUrl,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Token $secretKey",
          },
        ),
        data: requestBody,
      );
      return response;
    } catch (e) {
      print("Error: $e");
      // يمكن ترمي الخطأ عشان الفانكشن لازم ترجع Response أو ترمي استثناء
      rethrow;
    }
  }

  Future<String> getPaymentKey(int amount, String currency) async {
    try {
      String authenticationToken = await _getToken();

      int orderId = await _getOrderId(
        authanticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );

      String paymentKey = await _getPaymentKey(
        authanticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );
      return paymentKey;
    } catch (e) {
      print("Exc==========================================");
      print(e.toString());
      throw Exception();
    }
  }

  Future<String> _getToken() async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/auth/tokens",
      data: {
        "api_key":
            "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBMU1EQTJOeXdpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS45S2lGdUgxXzV2dmhwQXRJT2JRNjQzckMwdjAyTzFMdldzb1ZOWHhiR29nQURxQ0pOWjJVeG5tTm9LRkl1ZGE1MUVreUtULVQyWVZ0VVBlQjFwNVBaQQ==",
      },
    );
    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authanticationToken,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authanticationToken,
        "amount_cents": amount, //  >>(STRING)<<
        "currency": currency, //Not Req
        "delivery_needed": "false",
        "items": [],
      },
    );
    return response.data["id"]; //INTGER
  }

  Future<String> _getPaymentKey({
    required String authanticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        //ALL OF THEM ARE REQIERD
        "expiration": 3600,

        "auth_token": authanticationToken, //From First Api
        "order_id": orderId, //From Second Api  >>(STRING)<<
        "integration_id": 5129169, //Integration Id Of The Payment Method

        "amount_cents": amount,
        "currency": currency,

        "billing_data": {
          //Have To Be Values
          "first_name": "Clifford",
          "last_name": "Nicolas",
          "email": "claudette09@exa.com",
          "phone_number": "+86(8)9135210487",

          //Can Set "NA"
          "apartment": "NA",
          "floor": "NA",
          "street": "NA",
          "building": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "state": "NA",
        },
      },
    );
    return response.data["token"];
  }
}

class CheckoutWebView extends StatefulWidget {
  final String url;

  const CheckoutWebView({super.key, required this.url});

  @override
  State<CheckoutWebView> createState() => _CheckoutWebViewState();
}

class _CheckoutWebViewState extends State<CheckoutWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (url) async {
                print('Finished loading: $url');
                final currentUrl = await controller.currentUrl();
                if (currentUrl != null &&
                    (currentUrl.contains("https://accept.paymobsolutions.com/api/acceptance/post_pay") )) {
                  await Future.delayed( Duration(seconds: 1));
                 if(mounted) {
                    AppNavigator.pushNamed(
                      context,
                      AppRoutes.orderConfirmationRoute,
                    );
                  }
                }
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            AppbarWidget(title: AppStrings.payment(context:context)),
            Expanded(child: WebViewWidget(controller: controller)),
          ],
        ),
      ),
    );
  }
}
