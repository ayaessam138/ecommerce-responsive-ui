import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/helpers/app_images.dart';
import '../../../../core/helpers/app_spacing.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/helpers/app_values.dart';
import '../../../../core/helpers/biometerics_helper.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../emptysecreens/widgets/empty_screen_button.dart';

class SetupBiometricScreen extends StatefulWidget {
  const SetupBiometricScreen({super.key});

  @override
  State<SetupBiometricScreen> createState() => _SetupBiometricScreenState();
}

class _SetupBiometricScreenState extends State<SetupBiometricScreen> {
  List<BiometricType> availableBiometrics = [];

  @override
  void initState() {
    super.initState();
    _loadAvailableBiometrics();
  }

  void _loadAvailableBiometrics() async {
    final isSupported = await BiometricHelper.isBiometricSupported();
    if (!isSupported) {
      return;
    }

    final biometrics = await BiometricHelper.getAvailableBiometrics();
    if (!mounted) return;
    setState(() {
      availableBiometrics = biometrics;
      print("availableBiometrics");
      print(availableBiometrics);
    });
  }

  void _authenticateAndNavigate() async {
    if (availableBiometrics.isEmpty) {
      _showMessage(
        AppStrings.pleaseGoToSettingsPhoneAndSetUpBioMetrics(context: context),
      );
      return;
    }

    final didAuthenticate = await BiometricHelper.authenticate();
    if (!mounted) return;

    if (didAuthenticate) {
      AppNavigator.go(context, AppRoutes.bottomNavBarRoute);
    } else {
      _showMessage(AppStrings.authenticationFailed(context: context));
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: AutoSizeText(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: AppHeight.h16,
                    children: [
                      Image.asset(
                        AppImages.biometric,
                        height: AppHeight.fullHeight(context) * .3,
                        width: AppWidth.fullWidth(context),
                      ),
                      AutoSizeText(
                        textAlign: TextAlign.center,
                        AppStrings.projectYourAccountWithBiometrics(
                          context: context,
                        ),
                        style: TextStyles.font18Bold,
                      ),
                      AutoSizeText(
                        AppStrings.enhanceYourAccountSecurityWithAdvancedBiometricProtection(
                          context: context,
                        ),
                        style: TextStyles.font14Regular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(thickness: 0.2.w, color: ColorsManager.black),
            Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  AppButton(
                    title:
                        availableBiometrics.contains(BiometricType.face) &&
                                availableBiometrics.contains(
                                  BiometricType.fingerprint,
                                )
                            ? AppStrings.setupBioMetrics(context: context)
                            : availableBiometrics.contains(
                              BiometricType.fingerprint,
                            )
                            ? AppStrings.setupFingerPrint(context: context)
                            : AppStrings.setupFaceId(context: context),
                    onTap: _authenticateAndNavigate,
                  ),
                  AppSpace.vertical(AppHeight.h16),
                  AppButton(
                    title: AppStrings.skip(context: context),
                    onTap: () {
                      AppNavigator.go(context, AppRoutes.bottomNavBarRoute);
                    },
                    buttoncolor: ColorsManager.white,
                    buttonTextcolor: ColorsManager.black,
                    bordercolor: ColorsManager.lightGreyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SetupFaceIdScreen extends StatelessWidget {
//   const SetupFaceIdScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManager.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Spacer(),
//             Expanded(
//               flex: 3,
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(AppPadding.p16),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     spacing: AppHeight.h16,
//                     children: [
//                       SvgPicture.asset(AppImages.setupFaceId),
//                       AutoSizeText(
//                         textAlign: TextAlign.center,
//                         AppStrings.projectYourAccountWithBiometrics(
//                           context: context,
//                         ),
//                         style: TextStyles.font18Bold,
//                       ),
//                       AutoSizeText(
//                         AppStrings.enhanceYourAccountSecurityWithAdvancedBiometricProtection(
//                           context: context,
//                         ),
//                         style: TextStyles.font14Regular,
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Divider(thickness: 0.2.w, color: ColorsManager.black),
//             Padding(
//               padding: EdgeInsets.all(AppPadding.p16),
//               child: Column(
//                 children: [
//                   AppButton(
//                     title: AppStrings.setupFaceId(context: context),
//                     onTap: () {},
//                   ),
//                   AppSpace.vertical(AppHeight.h16),
//                   AppButton(
//                     title: AppStrings.skip(context: context),
//                     onTap: () {
//                       AppNavigator.go(context, AppRoutes.bottomNavBarRoute);
//                     },
//                     buttoncolor: ColorsManager.white,
//                     buttonTextcolor: ColorsManager.black,
//                     bordercolor: ColorsManager.lightGreyColor,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
