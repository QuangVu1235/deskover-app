import 'package:deskover_app/api/sign/login_resquest.dart';
import 'package:deskover_app/api/sign/response/user_response.dart';
import 'package:deskover_app/api/user.dart';
import 'package:deskover_app/api/user_info.dart';
import 'package:deskover_app/utils/AppUtils.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  // TODO: Set up and define the methods for network operations
  final Dio _dio = Dio();
  final _baseUrl = 'https://reqres.in/api';
  final _baseLocalhost = 'http://10.0.2.2:8080';

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('uToken');
    print(action);
  }

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get(_baseUrl + '/users/$id');
      print('User Info: ${userData.data}');
      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        _baseUrl+'/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }
  Future<UserResponse?> login({required UserLogin userLogin}) async {
    UserResponse? userResponse;
    try {
      Response response = await _dio.post(
        _baseLocalhost+'/v1/api/admin/auth/login',
        data: userLogin.toJson(),
      );

      print('\n\n\nToken: ${response.data}');
      userResponse = UserResponse.fromJson(response.data);
    }on DioError catch (e) {
      print(e);
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    }
    return userResponse;
  }
}