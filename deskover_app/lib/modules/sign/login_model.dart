// import 'package:deskover_app/api/sign/login_resquest.dart';
// import 'package:deskover_app/client/dio_client.dart';
// import 'package:deskover_app/utils/widgets/view_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../api/sign/response/user_response.dart';
//
//
// class LoginModel extends ViewModel{
//
//   final UserLogin _userLogin;
//   final UserResponse userResponse;
//   final DioClient _dioClient = DioClient();
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController username = TextEditingController();
//   final TextEditingController password = TextEditingController();
//
//   LoginModel(this._userLogin, this.userResponse);
//
//   void onLogin() async{
//
//     if (!(formKey.currentState?.validate() ?? false)) {
//       // not validate or null
//       return;
//     }
//     UserLogin userLogin = UserLogin(
//       username: username.text,
//       password: password.text,
//     );
//
//     loading(() async {
//       UserResponse? retrievedUser = await _dioClient.login(userLogin: userLogin);
//       if(retrievedUser == null){
//         throw 'Tài khoản không tồn tại';
//       }
//
//     }).catchError((error){
//
//     });
//   }
// }