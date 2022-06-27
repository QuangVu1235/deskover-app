import 'dart:async';
import 'dart:io';
import 'package:deskover_app/config/base_api.dart';
import 'package:deskover_app/config/injection_config.config.dart';
import 'package:deskover_app/core/dio_cache/dio_cache_manager.dart';
import 'package:deskover_app/utils/AppUtils.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureDependencies() async => $initGetIt(getIt);

@module
abstract class ModuleRegister {
  @preResolve
  Future<SharedPreferences> sharedPreferences() async => SharedPreferences.getInstance();

  @LazySingleton()
  DioCacheManager getDioCache() {
    return DioCacheManager();
  }

  @LazySingleton()
  Dio getDio(SharedPreferences sharedPreferences, DioCacheManager dioCacheManager) {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options = BaseOptions(headers: {
      'Authorization': (sharedPreferences.getString('uToken') ?? '').isNotEmpty
          ? 'Bearer ${sharedPreferences.getString('uToken')}'
          : "BaseApi.mutosiStoreToken",
    });
    dio.interceptors.add(dioCacheManager.interceptor);
    // if (kDebugMode) {
    // if (StaticData.isShowLog) {
    //   dio.interceptors.add(PrettyDioLogger(
    //     request: false,
    //     requestHeader: false,
    //     requestBody: false,
    //     responseHeader: false,
    //     responseBody: false,
    //     error: true,
    //     compact: false,
    //     maxWidth: 90,
    //   ));
    // }
    dio.interceptors.add(InterceptorsWrapper(
      onError: (dioError, handler) async {
        if (dioError.response?.statusCode == HttpStatus.unauthorized) {
          if (sharedPreferences.containsKey('uToken')) {
            sharedPreferences.remove('uToken');
          }
          await getIt.reset();
          await configureDependencies();
          await AppUtils().showPopup(
            title: 'Không thể truy cập',
            subtitle: dioError.response?.data['message'] ?? 'Vui lòng đăng nhập để có thể sử dụng đầy đủ tính năng của phần mềm',
            isSuccess: false,
          );
          // if (null != Get.context && Navigator.canPop(Get.context!)) {
          //   Get.off(SigninSignupScreen(initScreen: 1,));
          // }
          // else {
          //   Get.to(SigninSignupScreen(initScreen: 1,));
          // }
        }
        handler.reject(dioError);
      },
    ));
    return dio;
  }
}

@Singleton()
class NumCartDetail {
  StreamController<int>? cacheController;
  StreamController<int> get getStreamController {
    if (cacheController?.isClosed ?? true) {
      cacheController ??= StreamController<int>.broadcast();
    }
    return cacheController!;
  }
  int number = 0;
  void setUpto(int number) {
    this.number += number;
    getStreamController.sink.add(this.number);
  }
  void setState(int number) {
    this.number = number;
    getStreamController.sink.add(this.number);
  }
  @disposeMethod
  void disposeCartNumberStream() {
    if (!getStreamController.isClosed) {
      getStreamController.close();
    }
  }
}

@Singleton()
class NumCartPoint {
  StreamController<int>? cacheController;
  StreamController<int> get getStreamController {
    if (cacheController?.isClosed ?? true) {
      cacheController ??= StreamController<int>.broadcast();
    }
    return cacheController!;
  }
  int number = 0;
  void setUpto(int number) {
    this.number += number;
    getStreamController.sink.add(this.number);
  }
  void setState(int number) {
    this.number = number;
    getStreamController.sink.add(this.number);
  }
  @disposeMethod
  void disposeCartNumberStream() {
    if (!getStreamController.isClosed) {
      getStreamController.close();
    }
  }
}
