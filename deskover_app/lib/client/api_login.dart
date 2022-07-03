import 'package:deskover_app/api/user.dart';
import 'package:deskover_app/config/base_api.dart';
import 'package:deskover_app/entity/sign/login_resquest.dart';
import 'package:deskover_app/entity/sign/response/user_response.dart';
import 'package:deskover_app/utils/AppUtils.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {

  final Dio _dio = Dio();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('uToken');
    print(action);
  }

  Future<UserResponse?> login({required UserLogin userLogin}) async {
    UserResponse? userResponse;
    try {
      Response response = await _dio.post(
        BaseApi.baseUrl+'/v1/api/admin/auth/login',
        data: userLogin.toJson(),
      );

      print('\n\n\nToken: ${response.data}');
      userResponse = UserResponse.fromJson(response.data);
    }on DioError catch (e) {
      AppUtils().showPopup(
        title: 'Đăng nhập thất bại',
        subtitle: 'Tài khoản hoặc mật khẩu không chính xác',
        isSuccess: false,
      );
      print(e);
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    }
    return userResponse;
  }

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get(BaseApi.baseUrl + '/users/$id');
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
}