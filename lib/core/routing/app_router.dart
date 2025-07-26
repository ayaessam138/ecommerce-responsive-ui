
import 'package:client/features/botoomNavbar/persentation/screens/bottom_navbar_screen.dart';
import 'package:client/features/cart/persentation/screens/cart_screen.dart';
import 'package:client/features/categories/persentation/screens/all_categories_screen.dart';
import 'package:client/features/checkout/persentation/screens/checkout_screen.dart';
import 'package:client/features/checkout/persentation/screens/order_confimation_screen.dart';
import 'package:client/features/compareproducts/persentation/screens/compare_product_screen.dart';
import 'package:client/features/login/persentation/screens/login_verification_screen.dart';
import 'package:client/features/login/persentation/screens/setup_biometric_screen.dart';
import 'package:client/features/offers/persentation/screens/all_products_offer_screen.dart';
import 'package:client/features/onboarding/persentation/scrrens/on_boarding_screen.dart';
import 'package:client/features/order/persentation/screens/my_orders_screen.dart';
import 'package:client/features/order/persentation/screens/myorder_details_screen.dart';
import 'package:client/features/order/persentation/widgets/sucess_order_paymen_screen.dart';
import 'package:client/features/product/persentation/screens/all_product_screen.dart';
import 'package:client/features/product/persentation/screens/product_details_screen.dart';
import 'package:client/features/productReview/persentation/screens/product_review_screen.dart';
import 'package:client/features/profile/persentation/Screens/addadress_screen.dart';
import 'package:client/features/profile/persentation/Screens/adress_screen.dart';
import 'package:client/features/profile/persentation/Screens/coupons_screen.dart';
import 'package:client/features/profile/persentation/Screens/edit_profile_screen.dart';
import 'package:client/features/profile/persentation/Screens/faceid_screen.dart';
import 'package:client/features/profile/persentation/Screens/language_screen.dart';
import 'package:client/features/profile/persentation/Screens/notifcation_screen.dart';
import 'package:client/features/profile/persentation/Screens/recive_notifcations_screen.dart';
import 'package:client/features/profile/persentation/Screens/return_policy_screen.dart';
import 'package:client/features/profile/persentation/Screens/settings_screen.dart';
import 'package:client/features/profile/persentation/Screens/wallet_screen.dart';
import 'package:client/features/profile/persentation/Screens/wishList_screen.dart';
import 'package:client/features/profile/persentation/controller/profile_cubit.dart';
import 'package:client/features/search/persentation/screens/search_screen.dart';
import 'package:client/features/setupProfile/persentation/controller/set_up_profile_cubit.dart';
import 'package:client/features/setupProfile/persentation/screens/setup_profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/categories/persentation/screens/categorey_prooducts_screen.dart';
import '../../features/login/persentation/screens/login_screen.dart';
import '../../features/login/persentation/screens/setup_password_screen.dart';
import '../../features/profile/persentation/Screens/privacy_policy_screen.dart';
import '../helpers/dependency_injection.dart';
import '../helpers/functions.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppHeleperFunctions.getinialRoutes(),
    routes: [
      // GoRoute(
      //   name: AppRoutes.splashScreen,
      //   path: AppRoutes.splashScreen,
      //   builder: (context, state) => const SplashScreen(),
      // ),
      //onBoradingScreen
      GoRoute(
        name: AppRoutes.onBoradingRoute,
        path: AppRoutes.onBoradingRoute,
        builder: (context, state) => const OnBoradingScreen(),
      ),
      //loginScreen
      GoRoute(
        name: AppRoutes.loginRoute,
        path: AppRoutes.loginRoute,
        builder: (context, state) => LoginScreen(),
      ),
      //loginVerificationScreen
      GoRoute(
        name: AppRoutes.loginVerificationRoute,
        path: AppRoutes.loginVerificationRoute,
        builder: (context, state) => LoginVerificationScreen(),
      ),
      GoRoute(
        name: AppRoutes.setUpPasswordRoute,
        path: AppRoutes.setUpPasswordRoute,
        builder: (context, state) => SetupPasswordScreen(),
      ),

      //setUpProfileScreen
      GoRoute(
        name: AppRoutes.setUpProfileRoute,
        path: AppRoutes.setUpProfileRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<SetUpProfileCubit>(),
              child: SetupProfileScreen(),
            ),
      ),
      GoRoute(
        name: AppRoutes.setupFaceIdRoute,
        path: AppRoutes.setupFaceIdRoute,
        builder: (context, state) => SetupBiometricScreen(),
      ),
      //BottomNavBar(home)
      GoRoute(
        name: AppRoutes.bottomNavBarRoute,
        path: AppRoutes.bottomNavBarRoute,
        builder: (context, state) => BottomNavBarScreen(),
      ),
      GoRoute(
        name: AppRoutes.notificationRoute,
        path: AppRoutes.notificationRoute,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        name: AppRoutes.searchRoute,
        path: AppRoutes.searchRoute,
        builder: (context, state) => SearchScreen(),
      ),
      GoRoute(
        name: AppRoutes.allProductsRoute,
        path: AppRoutes.allProductsRoute,
        builder: (context, state) => AllProductScreen(),
      ),
      //categories
      GoRoute(
        name: AppRoutes.allCategoriesRoute,
        path: AppRoutes.allCategoriesRoute,
        builder: (context, state) => AllCategoriesScreen(),
      ),
      GoRoute(
        name: AppRoutes.categoryProductRoute,
        path: AppRoutes.categoryProductRoute,
        builder: (context, state) => CategoryProductsScreen(),
      ),

      //profile screens
      GoRoute(
        name: AppRoutes.wishListRoute,
        path: AppRoutes.wishListRoute,
        builder: (context, state) => WishlistScreen(),
      ),
      GoRoute(
        name: AppRoutes.editProfileRoute,
        path: AppRoutes.editProfileRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<ProfileCubit>(),
              child: EditProfileScreen(),
            ),
      ),
      GoRoute(
        name: AppRoutes.addressRoute,
        path: AppRoutes.addressRoute,
        builder: (context, state) => AddressScreen(),
      ),
      GoRoute(
        name: AppRoutes.addAddressRoute,
        path: AppRoutes.addAddressRoute,
        builder: (context, state) => AddAddressScreen(),
      ),
      GoRoute(
        name: AppRoutes.walletRoute,
        path: AppRoutes.walletRoute,
        builder: (context, state) => WalletScreen(),
      ),
      GoRoute(
        name: AppRoutes.couponsRoute,
        path: AppRoutes.couponsRoute,
        builder: (context, state) => CouponsScreen(),
      ),
      GoRoute(
        name: AppRoutes.settingsRoute,
        path: AppRoutes.settingsRoute,
        builder: (context, state) => SettingsScreen(),
      ),
      GoRoute(
        name: AppRoutes.receiveNotificationsScreenRoute,
        path: AppRoutes.receiveNotificationsScreenRoute,
        builder: (context, state) => ReceiveNotificationsScreen(),
      ),
      GoRoute(
        name: AppRoutes.privacyPolicyRoute,
        path: AppRoutes.privacyPolicyRoute,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),
      GoRoute(
        name: AppRoutes.returnPolicyRoute,
        path: AppRoutes.returnPolicyRoute,
        builder: (context, state) => ReturnPolicyScreen(),
      ),
      //language
      GoRoute(
        name: AppRoutes.languageRoute,
        path: AppRoutes.languageRoute,
        builder: (context, state) => LanguageScreen(),
      ),
      GoRoute(
        name: AppRoutes.faceIdRoute,
        path: AppRoutes.faceIdRoute,
        builder: (context, state) => FaceIdScreen(),
      ),
      //orders
      GoRoute(
        name: AppRoutes.myOrderRoute,
        path: AppRoutes.myOrderRoute,
        builder: (context, state) => MyOrdersScreen(),
      ),
      //MyOrderDetails
      GoRoute(
        name: AppRoutes.myOrderDetailsRoute,
        path: AppRoutes.myOrderDetailsRoute,
        builder: (context, state) => MyOrderDetailsScreen(),
      ),
      GoRoute(
        name: AppRoutes.productReviewRoute,
        path: AppRoutes.productReviewRoute,
        builder: (context, state) => ProductReviewScreen(),
      ),

      //cart
      GoRoute(
        name: AppRoutes.cartRoute,
        path: AppRoutes.cartRoute,
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        name: AppRoutes.checkoutRoute,
        path: AppRoutes.checkoutRoute,
        builder: (context, state) => CheckoutScreen(),
      ),
      GoRoute(
        name: AppRoutes.orderConfirmationRoute,
        path: AppRoutes.orderConfirmationRoute,
        builder: (context, state) => OrderConfirmationScreen(),
      ),
      GoRoute(
        name: AppRoutes.successOrderCancelRoute,
        path: AppRoutes.successOrderCancelRoute,
        builder: (context, state) => SuccessOrderPaymentScreen(),
      ),
      GoRoute(
        name: AppRoutes.productDetailsRoute,
        path: AppRoutes.productDetailsRoute,
        builder: (context, state) => ProductDetailsScreen(),
      ),
      //
      GoRoute(
        name: AppRoutes.compareProductRoute,
        path: AppRoutes.compareProductRoute,
        builder: (context, state) => CompareProductScreen(),
      ),
      GoRoute(
        name: AppRoutes.allOffersProductRoute,
        path: AppRoutes.allOffersProductRoute,
        builder: (context, state) => AllOfferProductsScreen(),
      ),
    ],
  );
}
