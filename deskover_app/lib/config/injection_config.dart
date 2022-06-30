// import 'dart:async';
// import 'dart:io';
// import 'package:deskover_app/modules/sign/login.dart';
// import 'package:deskover_app/utils/AppUtils.dart';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/status/http_status.dart';
// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// @module
// abstract class ModuleRegister {
//   @preResolve
//   Future<SharedPreferences> sharedPreferences() async => SharedPreferences.getInstance();
//
//   @LazySingleton()
//   Dio getDio(SharedPreferences sharedPreferences) {
//     Dio dio = Dio();
//     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
//       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
//     dio.options = BaseOptions(headers: {
//       'Authorization': (sharedPreferences.getString('uToken') ?? '').isNotEmpty
//           ? 'Bearer ${sharedPreferences.getString('uToken')}'
//           : '',
//     });
//     // if (kDebugMode) {
//     // if (StaticData.isShowLog) {
//     //   dio.interceptors.add(PrettyDioLogger(
//     //     request: false,
//     //     requestHeader: false,
//     //     requestBody: false,
//     //     responseHeader: false,
//     //     responseBody: false,
//     //     error: true,
//     //     compact: false,
//     //     maxWidth: 90,
//     //   ));
//     // }
//     dio.interceptors.add(InterceptorsWrapper(
//       onError: (dioError, handler) async {
//         if (dioError.response?.statusCode == HttpStatus.unauthorized) {
//           if (sharedPreferences.containsKey('uToken')) {
//             sharedPreferences.remove('uToken');
//           }
//           await AppUtils().showPopup(
//             title: 'Không thể truy cập',
//             subtitle: dioError.response?.data['message'] ?? 'Vui lòng đăng nhập để có thể sử dụng đầy đủ tính năng của phần mềm',
//             isSuccess: false,
//           );
//           if (null != Get.context && Navigator.canPop(Get.context!)) {
//             Get.off(Login(initScreen: 1,));
//           }
//           else {
//             Get.to(Login(initScreen: 1,));
//           }
//         }
//         handler.reject(dioError);
//       },
//     ));
//     return dio;
//   }
// }
//
//
//
//
