import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppStrings {
  //onBoarding

  static String next({BuildContext? context}) => 'next'.tr(context: context);
  // login

  static String signIn({BuildContext? context}) =>
      'signIn/signUp'.tr(context: context);
  static String signUp({BuildContext? context}) =>
      'signUp'.tr(context: context);
  static String verifications({BuildContext? context}) =>
      'verification'.tr(context: context);
  static String phoneNumber({BuildContext? context}) =>
      'phoneNumber'.tr(context: context);
  static String enterTheVerificationCodeSentTo({BuildContext? context}) =>
      'enterTheVerificationCodeSentTo'.tr(context: context);
  static String requestANewVerificationCode({BuildContext? context}) =>
      'requestANewVerificationCode'.tr(context: context);
  static String continues({BuildContext? context}) =>
      'continues'.tr(context: context);
  static String resendVerificationCode({BuildContext? context}) =>
      'resendVerificationCode'.tr(context: context);
  static String password({BuildContext? context}) =>
      'password'.tr(context: context);

  // setup profile

  static String email({BuildContext? context}) => 'email'.tr(context: context);
  static String phone({BuildContext? context}) => 'phone'.tr(context: context);
  static String dateOfBirth({BuildContext? context}) =>
      'dateOfBirth'.tr(context: context);
  static String fullName({BuildContext? context}) =>
      'fullName'.tr(context: context);
  static String firstName({BuildContext? context}) =>
      'firstName'.tr(context: context);
  static String lastName({BuildContext? context}) =>
      'lastName'.tr(context: context);
  static String setUpProfile({BuildContext? context}) =>
      'setUpProfile'.tr(context: context);
  static String skip({BuildContext? context}) => 'skip'.tr(context: context);
  static String uploadImage({BuildContext? context}) =>
      'uploadImage'.tr(context: context);
  //setUpFaceId
  static String projectYourAccountWithBiometrics({BuildContext? context}) =>
      'projectYourAccountWithBiometrics'.tr(context: context);
  static String enhanceYourAccountSecurityWithAdvancedBiometricProtection({
    BuildContext? context,
  }) => 'enhanceYourAccountSecurityWithAdvancedBiometricProtection'.tr(
    context: context,
  );
  static String setupBioMetrics({BuildContext? context}) =>
      'setupBioMetrics'.tr(context: context);
  static String setupFaceId({BuildContext? context}) =>
      'setupFaceId'.tr(context: context);
  static String setupFingerPrint({BuildContext? context}) =>
      'setupFingerPrint'.tr(context: context);
  static String pleaseGoToSettingsPhoneAndSetUpBioMetrics({
    BuildContext? context,
  }) => 'pleaseGoToSettingsPhoneAndSetUpBioMetrics'.tr(context: context);
  static String authenticationFailed({BuildContext? context}) =>
      'authenticationFailed'.tr(context: context);
  static String pleaseOpenYourLocation({BuildContext? context}) =>
      'pleaseOpenYourLocation'.tr(context: context);
  static String unknownLocation({BuildContext? context}) =>
      'unknownLocation'.tr(context: context);

  //home

  static String deliveryTo({BuildContext? context}) =>
      'deliveryTo'.tr(context: context);
  static String unkown({BuildContext? context}) =>
      'unkown'.tr(context: context);
  static String search({BuildContext? context}) =>
      'search'.tr(context: context);
  static String seeALL({BuildContext? context}) =>
      'seeALL'.tr(context: context);
  static String popularProducts({BuildContext? context}) =>
      'popularProducts'.tr(context: context);
  static String newlyLaunched({BuildContext? context}) =>
      'newlyLaunched'.tr(context: context);
  //editProfile
  static String editProfile({BuildContext? context}) =>
      'editProfile'.tr(context: context);
  static String saveNow({BuildContext? context}) =>
      'saveNow'.tr(context: context);
  static String categories({BuildContext? context}) =>
      'categories'.tr(context: context);
  static String salesProducts({BuildContext? context}) =>
      'salesProducts'.tr(context: context);
  static String sale({BuildContext? context}) => 'sale'.tr(context: context);
  static String add({BuildContext? context}) => 'add'.tr(context: context);

  //profile
  static String myAccount({BuildContext? context}) =>
      'myAccount'.tr(context: context);
  static String myVoucher({BuildContext? context}) =>
      'myVoucher'.tr(context: context);
  static String myOrders({BuildContext? context}) =>
      'myOrders'.tr(context: context);
  static String myFavorite({BuildContext? context}) =>
      'myFavorite'.tr(context: context);
  static String myProfile({BuildContext? context}) =>
      'myProfile'.tr(context: context);
  static String logout({BuildContext? context}) =>
      'logout'.tr(context: context);
  static String areYouSureThatYouWantToLogoutOfYourAccount({
    BuildContext? context,
  }) => 'areYouSureThatYouWantToLogoutOfYourAccount'.tr(context: context);
  static String keepIt({BuildContext? context}) =>
      'keepIt'.tr(context: context);
  static String confirmLogout({BuildContext? context}) =>
      'confirmLogout'.tr(context: context);
  static String deleteAccount({BuildContext? context}) =>
      'deleteAccount'.tr(context: context);
  static String areYouSureThatYouWantToDeleteYourAccount({
    BuildContext? context,
  }) => 'areYouSureThatYouWantToDeleteYourAccount'.tr(context: context);
  static String delete({BuildContext? context}) =>
      'delete'.tr(context: context);
  //myOrders
  static String amount({BuildContext? context}) =>
      'amount'.tr(context: context);

  //wishlist
  static String wishList({BuildContext? context}) =>
      'wishList'.tr(context: context);
  static String findSomeThing({BuildContext? context}) =>
      'findSomeThing'.tr(context: context);
  //COUPONS
  static String coupons({BuildContext? context}) =>
      'coupons'.tr(context: context);
  static String tapToApply({BuildContext? context}) =>
      'tapToApply'.tr(context: context);

  //Manage Adress
  static String manageAddress({BuildContext? context}) =>
      'manageAddress'.tr(context: context);
  static String addSippingAddress({BuildContext? context}) =>
      'addSippingAddress'.tr(context: context);
  static String chooseAddressType({BuildContext? context}) =>
      'chooseAddressType'.tr(context: context);
  static String home({BuildContext? context}) => 'home'.tr(context: context);
  static String office({BuildContext? context}) =>
      'office'.tr(context: context);
  static String city({BuildContext? context}) => 'city'.tr(context: context);
  static String area({BuildContext? context}) => 'area'.tr(context: context);
  static String zipCode({BuildContext? context}) =>
      'zipCode'.tr(context: context);
  static String address({BuildContext? context}) =>
      'address'.tr(context: context);
  //wallet
  static String wallet({BuildContext? context}) =>
      'wallet'.tr(context: context);
  static String withDraw({BuildContext? context}) =>
      'withDraw'.tr(context: context);
  static String balance({BuildContext? context}) =>
      'balance'.tr(context: context);
  static String transcationHistory({BuildContext? context}) =>
      'transcationHistory'.tr(context: context);
  //settings
  static String settings({BuildContext? context}) =>
      'settings'.tr(context: context);
  static String privacyPolicy({BuildContext? context}) =>
      'privacyPolicy'.tr(context: context);
  static String returnPolicy({BuildContext? context}) =>
      'returnPolicy'.tr(context: context);
  static String faceId({BuildContext? context}) =>
      'faceId'.tr(context: context);
  //language
  static String language({BuildContext? context}) =>
      'language'.tr(context: context);
  static String arabic({BuildContext? context}) =>
      'arabic'.tr(context: context);
  static String english({BuildContext? context}) =>
      'english'.tr(context: context);
  static String confirm({BuildContext? context}) =>
      'confirm'.tr(context: context);
  //myOrderDetails
  static String myOrderDetails({BuildContext? context}) =>
      'myOrderDetails'.tr(context: context);
  static String name({BuildContext? context}) => 'name'.tr(context: context);
  static String orderSummary({BuildContext? context}) =>
      'orderSummary'.tr(context: context);
  static String subtotal({BuildContext? context}) =>
      'subtotal'.tr(context: context);
  static String discountApplied({BuildContext? context}) =>
      'discountApplied'.tr(context: context);
  static String shippingFee({BuildContext? context}) =>
      'shippingFee'.tr(context: context);
  static String estimatedVat({BuildContext? context}) =>
      'estimatedVat'.tr(context: context);
  static String totalAmount({BuildContext? context}) =>
      'totalAmount'.tr(context: context);
  static String needHelpWithAnyThing({BuildContext? context}) =>
      'needHelpWithAnyThing'.tr(context: context);
  static String call({BuildContext? context}) => 'call'.tr(context: context);
  static String cancelOrder({BuildContext? context}) =>
      'cancelOrder'.tr(context: context);
  static String returnOrder({BuildContext? context}) =>
      'returnOrder'.tr(context: context);
  static String orderReturnAndRefund({BuildContext? context}) =>
      'orderReturnAndRefund'.tr(context: context);
  static String orderCancel({BuildContext? context}) =>
      'orderCancel'.tr(context: context);

  //category
  static String sort({BuildContext? context}) => 'sort'.tr(context: context);
  static String filter({BuildContext? context}) =>
      'filter'.tr(context: context);
  static String showingResult({BuildContext? context}) =>
      'showingResult'.tr(context: context);
  static String applyNow({BuildContext? context}) =>
      'applyNow'.tr(context: context);
  static String priceLowToHigh({BuildContext? context}) =>
      'priceLowToHigh'.tr(context: context);
  static String priceHighToLow({BuildContext? context}) =>
      'priceHighToLow'.tr(context: context);
  static String highestRated({BuildContext? context}) =>
      'highestRated'.tr(context: context);
  static String aToZ({BuildContext? context}) => 'aToZ'.tr(context: context);
  static String zToA({BuildContext? context}) => 'zToA'.tr(context: context);
  static String newItem({BuildContext? context}) =>
      'newItem'.tr(context: context);
  static String color({BuildContext? context}) => 'color'.tr(context: context);
  static String size({BuildContext? context}) => 'size'.tr(context: context);
  static String price({BuildContext? context}) => 'price'.tr(context: context);
  static String rating({BuildContext? context}) =>
      'rating'.tr(context: context);
  static String highestToLowestRating({BuildContext? context}) =>
      'highestToLowestRating'.tr(context: context);
  static String lowestToHighestRating({BuildContext? context}) =>
      'lowestToHighestRating'.tr(context: context);
  static String stock({BuildContext? context}) => 'stock'.tr(context: context);
  static String availableStock({BuildContext? context}) =>
      'availableStock'.tr(context: context);
  static String notAvailableStock({BuildContext? context}) =>
      'notAvailableStock'.tr(context: context);

  //search
  static String recentSearches({BuildContext? context}) =>
      'recentSearches'.tr(context: context);

  static String cancel({BuildContext? context}) =>
      'cancel'.tr(context: context);

  // notifications
  static String turnOnNotifcations({BuildContext? context}) =>
      'turnOnNotifcations'.tr(context: context);
  static String notifications({BuildContext? context}) =>
      'notifications'.tr(context: context);
  static String
  enableNotifcationsToMakeSureThatYouDoNotMissOutOnTheTopicsYouHaveSubscribedTo({
    BuildContext? context,
  }) =>
      'enableNotifcationsToMakeSureThatYouDoNotMissOutOnTheTopicsYouHaveSubscribedTo'
          .tr(context: context);
  static String successfully({BuildContext? context}) =>
      'successfully'.tr(context: context);
  //seller
  static String products({BuildContext? context}) =>
      'products'.tr(context: context);
  //cart
  static String cart({BuildContext? context}) => 'cart'.tr(context: context);
  static String change({BuildContext? context}) =>
      'change'.tr(context: context);
  static String haveACoupon({BuildContext? context}) =>
      'haveACoupon'.tr(context: context);
  static String applyCoupon({BuildContext? context}) =>
      'applyCoupon'.tr(context: context);
  static String couponCode({BuildContext? context}) =>
      'couponCode'.tr(context: context);
  static String congratulations({BuildContext? context}) =>
      'congratulations'.tr(context: context);
  static String regularDelivery({BuildContext? context}) =>
      'regularDelivery'.tr(context: context);
  static String expressDelivery({BuildContext? context}) =>
      'expressDelivery'.tr(context: context);
  static String amountPayPal({BuildContext? context}) =>
      'amountPayPal'.tr(context: context);
  static String processToCheckOut({BuildContext? context}) =>
      'processToCheckOut'.tr(context: context);
  //checkout
  static String checkout({BuildContext? context}) =>
      'checkout'.tr(context: context);
  static String paymentMethod({BuildContext? context}) =>
      'paymentMethod'.tr(context: context);
  static String cash({BuildContext? context}) => 'cash'.tr(context: context);
  static String visa({BuildContext? context}) => 'visa'.tr(context: context);
  static String payPal({BuildContext? context}) =>
      'payPal'.tr(context: context);
  static String pay({BuildContext? context}) => 'pay'.tr(context: context);
  //orderConfirmation
  static String orderId({BuildContext? context}) =>
      'orderId'.tr(context: context);
  static String orderItem({BuildContext? context}) =>
      'orderItem'.tr(context: context);
  static String confirmWillBeSentToYourAppSms({BuildContext? context}) =>
      'confirmWillBeSentToYourAppSms'.tr(context: context);
  static String trackOrder({BuildContext? context}) =>
      'trackOrder'.tr(context: context);
  //productReview
  static String productReview({BuildContext? context}) =>
      'productReview'.tr(context: context);
  static String howIsYourProduct({BuildContext? context}) =>
      'howIsYourProduct'.tr(context: context);
  static String overAllRating({BuildContext? context}) =>
      'overAllRating'.tr(context: context);
  static String reviewDetails({BuildContext? context}) =>
      'reviewDetails'.tr(context: context);
  static String submitReview({BuildContext? context}) =>
      'submitReview'.tr(context: context);
  static String support({BuildContext? context}) =>
      'support'.tr(context: context);

  //  compareProducts
  static String compareProducts({BuildContext? context}) =>
      'compareProducts'.tr(context: context);
  //  ProductDetails
  static String unitPrice({BuildContext? context}) =>
      'unitPrice'.tr(context: context);
  static String sizeGuide({BuildContext? context}) =>
      'sizeGuide'.tr(context: context);
  static String keyInformation({BuildContext? context}) =>
      'keyInformation'.tr(context: context);
  static String rate({BuildContext? context}) => 'rate'.tr(context: context);
  static String info({BuildContext? context}) => 'info'.tr(context: context);
  static String shelfLife({BuildContext? context}) =>
      'shelfLife'.tr(context: context);
  static String packingType({BuildContext? context}) =>
      'shelfLife'.tr(context: context);
  static String unit({BuildContext? context}) => 'unit'.tr(context: context);
  static String madeBy({BuildContext? context}) =>
      'madeBy'.tr(context: context);
  static String deliveryInfo({BuildContext? context}) =>
      'deliveryInfo'.tr(context: context);
  static String addToCart({BuildContext? context}) =>
      'addToCart'.tr(context: context);
  static String replacement({BuildContext? context}) =>
      'replacement'.tr(context: context);
  static String delivery({BuildContext? context}) =>
      'delivery'.tr(context: context);
  static String fast({BuildContext? context}) => 'fast'.tr(context: context);
  static String productInformation({BuildContext? context}) =>
      'productInformation'.tr(context: context);
  static String internationalConversions({BuildContext? context}) =>
      'internationalConversions'.tr(context: context);
  static String profile({BuildContext? context}) =>
      'profile'.tr(context: context);
  static String main({BuildContext? context}) => 'Home'.tr(context: context);
  static String sales({BuildContext? context}) => 'sales'.tr(context: context);

  //emptyScreens
  static String noInternetonCnection({BuildContext? context}) =>
      'noInternetonCnection'.tr(context: context);
  static String noInternetonCnectionSubtile({BuildContext? context}) =>
      'noInternetonCnectionSubtile'.tr(context: context);
  static String enableWifi({BuildContext? context}) =>
      'enableWifi'.tr(context: context);
  static String noNotfications({BuildContext? context}) =>
      'noNotfications'.tr(context: context);
  static String noNotficationsSubTitle({BuildContext? context}) =>
      'noNotficationsSubTitle'.tr(context: context);
  static String backTomHome({BuildContext? context}) =>
      'backToHome'.tr(context: context);
  static String noCardSave({BuildContext? context}) =>
      'noCardSave'.tr(context: context);
  static String noCardSaveSubTitle({BuildContext? context}) =>
      'noCardSaveSubTitle'.tr(context: context);
  static String addCard({BuildContext? context}) =>
      'addCard'.tr(context: context);
  static String orderHistory({BuildContext? context}) =>
      'orderHistory'.tr(context: context);
  static String orderHistorySubTitle({BuildContext? context}) =>
      'orderHistorySubTitle'.tr(context: context);
  static String shopNow({BuildContext? context}) =>
      'shopNow'.tr(context: context);
  static String emptyCart({BuildContext? context}) =>
      'emptyCart'.tr(context: context);
  static String emptyCartSubTile({BuildContext? context}) =>
      'emptyCartSubTile'.tr(context: context);
  static String emptyWishlist({BuildContext? context}) =>
      'emptyWishlist'.tr(context: context);
  static String emptyWishlistSubtitle({BuildContext? context}) =>
      'emptyWishlistSubtitle'.tr(context: context);
  static String shippingAddress({BuildContext? context}) =>
      'shippingAddress'.tr(context: context);
  static String shippingAddressSubTitle({BuildContext? context}) =>
      'shippingAddressSubTitle'.tr(context: context);
  static String addAddress({BuildContext? context}) =>
      'addAddress'.tr(context: context);
  static String noResultFound({BuildContext? context}) =>
      'noResultFound'.tr(context: context);
  static String noSearchSubTiltle({BuildContext? context}) =>
      'noSearchSubTiltle'.tr(context: context);
  static String searchAgain({BuildContext? context}) =>
      'searchAgain'.tr(context: context);
  static String noCouponsYet({BuildContext? context}) =>
      'noCouponsYet'.tr(context: context);
  static String noCouponsYetSubTitle({BuildContext? context}) =>
      'noCouponsYetSubTitle'.tr(context: context);
  static String noLoyaltyCard({BuildContext? context}) =>
      'noLoyaltyCard'.tr(context: context);
  static String noLoyaltyCardSubTitlte({BuildContext? context}) =>
      'noLoyaltyCardSubTitlte'.tr(context: context);
  static String noReturnAndrefund({BuildContext? context}) =>
      'noReturnAndrefund'.tr(context: context);
  static String noReturnAndrefundSubtitle({BuildContext? context}) =>
      'noReturnAndrefundSubtitle'.tr(context: context);
  static String payment({BuildContext? context}) =>
      'payment'.tr(context: context);
}
