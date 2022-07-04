// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../api/sign/service/sign_api.dart' as _i6;
import '../api/sign/sign_datasource.dart' as _i8;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/dashboard/service/dashboard_api.dart' as _i7;
import '../modules/sign/login_model.dart' as _i10;
import '../usercases/sign_usecase.dart' as _i9;
import 'injection_config.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i5.Dio>(() => moduleRegister.getDio(
      get<_i4.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i6.SigninAPI>(() => _i6.SigninAPI(get<_i5.Dio>()));
  gh.lazySingleton<_i7.DashboardAPI>(() => _i7.DashboardAPI(get<_i5.Dio>()));
  gh.lazySingleton<_i8.SignDatasource>(
      () => _i8.SignDatasourceImpl(get<_i6.SigninAPI>()));
  gh.lazySingleton<_i9.SigninUsecase>(
      () => _i9.SigninUsecase(get<_i8.SignDatasource>()));
  gh.factory<_i10.LoginModel>(() =>
      _i10.LoginModel(get<_i9.SigninUsecase>(), get<_i4.SharedPreferences>()));
  return get;
}

class _$ModuleRegister extends _i11.ModuleRegister {}
