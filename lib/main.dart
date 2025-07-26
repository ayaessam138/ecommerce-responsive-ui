import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/app_bloc_provider_list.dart';
import 'core/helpers/app_secure_local_storage.dart';
import 'core/helpers/bloc_observal.dart';
import 'core/helpers/dependency_injection.dart';
import 'core/helpers/location_helper.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // الوضع الطولي العادي
    DeviceOrientation.portraitDown, // الوضع الطولي المقلوب (اختياري)
  ]);

  await initDI();
  await AppSecureLocalStorageHelper.init();
  await LocationHelper.initFromCache();
  await LocationHelper.requestLocationPermission();

  Bloc.observer = AppBlocObserver();
  await EasyLocalization.ensureInitialized(); // Initialize EasyLocalization
  await AppSecureLocalStorageHelper.init();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) {
        return EasyLocalization(
          startLocale: Locale("en"),
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          saveLocale: true,
          child: MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 816),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: appBlocProviders(),
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: ColorsManager.white),
            scaffoldBackgroundColor: ColorsManager.white,
          ),
          debugShowCheckedModeBanner: false,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routerDelegate: AppRouter.router.routerDelegate,
        ),
      ),
    );
  }
}
