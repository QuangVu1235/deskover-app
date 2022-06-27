import 'package:dio/dio.dart';

import '../api/signin_reponse.dart';

class ApiClient {
  final Dio _dio = Dio();
  Future login(String username, String password) async {
    try {
      SigninReponse response = (await _dio.post(
        'http://localhost:8080/authenticate',
        data: {
          'username': username,
          'password': password
        },

      )) as SigninReponse;
      Options(
        headers: {
          'Authorization': 'Bearer ${response.token}',
        },
      );
      //returns the successful user data json object
      print(response.token);
      return response.token;
    } on DioError catch (e) {
      //returns the error object if any
      return e.response!.data;
    }
  }

}