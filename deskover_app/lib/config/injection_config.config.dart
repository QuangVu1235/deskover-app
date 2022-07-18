// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../api/sign/service/sign_api.dart' as _i11;
import '../api/sign/sign_datasource.dart' as _i15;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/dashboard/dashboard_datasource.dart' as _i17;
import '../modules/dashboard/dashboard_model.dart' as _i20;
import '../modules/dashboard/service/dashboard_api.dart' as _i12;
import '../modules/main_page/home_page_model.dart' as _i4;
import '../modules/order/widgets/delivery/delivery_model.dart' as _i13;
import '../modules/profile/profile_model.dart' as _i5;
import '../modules/receive_orders/order_model.dart' as _i14;
import '../modules/receive_orders/service/find_by_order_code_api.dart' as _i8;
import '../modules/receive_orders/service/service/order_service.dart' as _i9;
import '../modules/sign/login_model.dart' as _i19;
import '../usercases/dashboard_usercase.dart' as _i18;
import '../usercases/order_usercase.dart' as _i10;
import '../usercases/sign_usecase.dart' as _i16;
import 'injection_config.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.lazySingleton<_i4.HomePageModel>(() => _i4.HomePageModel());
  gh.factory<_i5.ProfileModel>(() => _i5.ProfileModel());
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.lazySingleton<_i7.Dio>(() => moduleRegister.getDio(
      get<_i6.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i8.OrderApi>(() => _i8.OrderApi(get<_i7.Dio>()));
  gh.lazySingleton<_i9.OrderService>(
      () => _i9.OrderServiceImpl(get<_i8.OrderApi>()));
  gh.lazySingleton<_i10.OrderUsercase>(
      () => _i10.OrderUsercase(get<_i9.OrderService>()));
  gh.lazySingleton<_i11.SigninAPI>(() => _i11.SigninAPI(get<_i7.Dio>()));
  gh.lazySingleton<_i12.DashboardAPI>(() => _i12.DashboardAPI(get<_i7.Dio>()));
  gh.factory<_i13.DeliveryModel>(
      () => _i13.DeliveryModel(get<_i10.OrderUsercase>()));
  gh.factory<_i14.OrderModel>(() => _i14.OrderModel(get<_i10.OrderUsercase>()));
  gh.lazySingleton<_i15.SignDatasource>(
      () => _i15.SignDatasourceImpl(get<_i11.SigninAPI>()));
  gh.lazySingleton<_i16.SigninUsecase>(
      () => _i16.SigninUsecase(get<_i15.SignDatasource>()));
  gh.lazySingleton<_i17.DashBoardDataSource>(
      () => _i17.DashBoardDataSourceImpl(get<_i12.DashboardAPI>()));
  gh.lazySingleton<_i18.DashBoardUserCase>(
      () => _i18.DashBoardUserCase(get<_i17.DashBoardDataSource>()));
  gh.factory<_i19.LoginModel>(() =>
      _i19.LoginModel(get<_i16.SigninUsecase>(), get<_i6.SharedPreferences>()));
  gh.factory<_i20.DashBoardModel>(
      () => _i20.DashBoardModel(get<_i18.DashBoardUserCase>()));
  return get;
}

class _$ModuleRegister extends _i21.ModuleRegister {}
