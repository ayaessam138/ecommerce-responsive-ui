import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  // static const String splashRoute = '/';
  //  static const String onBoradingRoute = '/onBoradingRoute';
  static const String onBoradingRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String loginVerificationRoute = '/loginVerificationRoute';
  static const String setUpPasswordRoute = '/setUpPasswordRoute';
  static const String setupFaceIdRoute = '/setupFaceIdRoute';
  //profile
  static const String setUpProfileRoute = '/profileRoute';
  static const String notificationRoute= '/notificationRoute';
  static const String searchRoute= '/searchRoute';
  static const String allProductsRoute= '/allProductsRoute';
  static const String editProfileRoute = '/editProfileRoute';
  static const String wishListRoute = '/wishListRoute';
  static const String addressRoute = '/addressRoute';
  static const String addAddressRoute = '/addAddressRoute';
  static const String walletRoute = '/walletRoute';
  static const String couponsRoute = '/couponsRoute';
  static const String settingsRoute = '/settingsRoute';
  static const String receiveNotificationsScreenRoute = '/receiveNotificationsScreenRoute';
  static const String privacyPolicyRoute = '/privacyPolicyRoute';
  static const String returnPolicyRoute = '/returnPolicyRoute';
  static const String languageRoute = '/languageRoute';
  static const String faceIdRoute = '/faceIdRoute';
  static const String myOrderRoute = '/myOrderRoute';
  static const String myOrderDetailsRoute = '/myOrderDetailsRoute';
  static const String allCategoriesRoute = '/allCategoriesRoute';
  static const String categoryProductRoute = '/categoryProductRoute';
  static const String allOffersProductRoute = '/allOffersProductRoute';
  static const String cartRoute = '/cartRoute';
  static const String checkoutRoute = '/checkoutRoute';
  static const String orderConfirmationRoute= '/orderConfirmationRoute';
  static const String productDetailsRoute= '/productDetailsRoute';
  static const String productReviewRoute= '/productReviewRoute';
  static const String compareProductRoute= '/compareProductRoute';


  //bottomNavBar
  static const String bottomNavBarRoute = '/bottomNavBarRoute';

  //order
  static const String successOrderCancelRoute = '/successOrderCancelRoute';
  static const String homeRoute = '/homeRoute';
  static const String eventsRoute = '/eventsRoute';
  static const String eventsDeatilsRoute = '/eventsDeatilsRoute';
  static const String organizerRoute = '/organizerRoute';
  static const String otpScrren = '/otpScrren';
}

class AppNavigator {
  AppNavigator._();

  static void go(BuildContext context, String path) {
    context.go(path);
  }

  static void goNamed(
    BuildContext context,
    String name, {
    Map<String, String>? params,
  }) {
    context.goNamed(name, pathParameters: params ?? {});
  }

  static void push(BuildContext context, String path) {
    context.push(path);
  }

  static void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String>? params,
  }) {
    context.pushNamed(name, pathParameters: params ?? {});
  }

  static void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }
}
