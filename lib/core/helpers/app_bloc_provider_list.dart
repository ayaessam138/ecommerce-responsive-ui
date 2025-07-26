import 'package:client/core/cubit/settings_cubit.dart';
import 'package:client/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:client/features/login/persentation/controller/login_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency_injection.dart';

List<BlocProvider> appBlocProviders() {
  return [
    BlocProvider<LoginCubit>(create: (context) => getIt<LoginCubit>()),
    BlocProvider<BottomNavBarCubit>(
      create: (context) => getIt<BottomNavBarCubit>(),
    ),
    BlocProvider<SettingsCubit>(
      create:
          (context) => getIt<SettingsCubit>()..initLocationTracking(),
    ),
  ];
}
