
import 'package:client/core/cubit/settings_cubit.dart';
import 'package:client/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:client/features/login/data/api/login_api.dart';
import 'package:client/features/login/data/repo/login_repo.dart';
import 'package:client/features/login/persentation/controller/login_cubit.dart';
import 'package:client/features/profile/data/api/profile_api.dart';
import 'package:client/features/profile/data/repo/profile_repo.dart';
import 'package:client/features/profile/persentation/controller/profile_cubit.dart';
import 'package:client/features/setupProfile/persentation/controller/set_up_profile_cubit.dart';
import 'package:get_it/get_it.dart';

import '../localstorage/api_loacal_data_source.dart';
import '../localstorage/hive_helper.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';

var getIt = GetIt.instance;

Future initDI() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => DioClient());
  getIt.registerFactory<NetworkInfo>(() => NetworkInfoImpl());

  getIt.registerLazySingleton<HiveHelper>(() => HiveHelper());
  getIt.registerLazySingleton<ApiLocalDataSource>(
    () => ApiLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<LoginApi>(() => LoginApiImpl(dioClient: getIt()));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt(), networkInfo: getIt()),
  );
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(loginRepo: getIt()));
  getIt.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());
  getIt.registerFactory<SetUpProfileCubit>(() => SetUpProfileCubit());
  getIt.registerLazySingleton<ProfileApi>(() => ProfileApiImpl(dioClient: getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(profileApi: getIt(), networkInfo: getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(profileRepo: getIt()));
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}
