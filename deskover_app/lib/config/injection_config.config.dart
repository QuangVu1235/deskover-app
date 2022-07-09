// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../api/sign/service/sign_api.dart' as _i10;
import '../api/sign/sign_datasource.dart' as _i13;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/dashboard/dashboard_datasource.dart' as _i15;
import '../modules/dashboard/dashboard_model.dart' as _i18;
import '../modules/dashboard/service/dashboard_api.dart' as _i11;
import '../modules/main_page/home_page_model.dart' as _i4;
import '../modules/receive_orders/order_model.dart' as _i12;
import '../modules/receive_orders/service/find_by_order_code_api.dart' as _i7;
import '../modules/receive_orders/service/service/order_service.dart' as _i8;
import '../modules/sign/login_model.dart' as _i17;
import '../usercases/dashboard_usercase.dart' as _i16;
import '../usercases/order_usercase.dart' as _i9;
import '../usercases/sign_usecase.dart' as _i14;
import 'injection_config.dart' as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i4.HomePageModel>(() => _i4.HomePageModel());
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i6.Dio>(() => moduleRegister.getDio(
      get<_i5.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i7.OrderApi>(() => _i7.OrderApi(get<_i6.Dio>()));
  gh.lazySingleton<_i8.OrderService>(
      () => _i8.OrderServiceImpl(get<_i7.OrderApi>()));
  gh.lazySingleton<_i9.OrderUsercase>(
      () => _i9.OrderUsercase(get<_i8.OrderService>()));
  gh.lazySingleton<_i10.SigninAPI>(() => _i10.SigninAPI(get<_i6.Dio>()));
  gh.lazySingleton<_i11.DashboardAPI>(() => _i11.DashboardAPI(get<_i6.Dio>()));
  gh.factory<_i12.OrderModel>(() => _i12.OrderModel(get<_i9.OrderUsercase>()));
  gh.lazySingleton<_i13.SignDatasource>(
      () => _i13.SignDatasourceImpl(get<_i10.SigninAPI>()));
  gh.lazySingleton<_i14.SigninUsecase>(
      () => _i14.SigninUsecase(get<_i13.SignDatasource>()));
  gh.lazySingleton<_i15.DashBoardDataSource>(
      () => _i15.DashBoardDataSourceImpl(get<_i11.DashboardAPI>()));
  gh.lazySingleton<_i16.DashBoardUserCase>(
      () => _i16.DashBoardUserCase(get<_i15.DashBoardDataSource>()));
  gh.factory<_i17.LoginModel>(() =>
      _i17.LoginModel(get<_i14.SigninUsecase>(), get<_i5.SharedPreferences>()));
  gh.factory<_i18.DashBoardModel>(
      () => _i18.DashBoardModel(get<_i16.DashBoardUserCase>()));
  return get;
}

class _$ModuleRegister extends _i19.ModuleRegister {}
