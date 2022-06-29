import 'package:deskover_app/client/dio_client.dart';
import 'package:deskover_app/api/sign/login_resquest.dart';
import 'package:deskover_app/api/user_info.dart';
import 'package:deskover_app/api/sign/response/user_response.dart';
import 'package:deskover_app/api/widget/create.dart';
import 'package:deskover_app/component/widget/global_input_form_widget.dart';
import 'package:deskover_app/modules/main_page/home_page.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/space_values.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  late final TextEditingController _username;
  late final TextEditingController _password;

  final DioClient _dioClient = DioClient();
  bool isCreating = false;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: UIColors.black10 ,
          child: Stack(
            children:  <Widget>[
              Container(
                height: heightOfScreen * 0.45,
                width: widthOfScreen,
                decoration: const BoxDecoration(
                    color: Colors.white,// Set border width
                    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)
                        ), // Set rounded corner radius
                    boxShadow: [BoxShadow(blurRadius: 10,color: UIColors.black10,offset: Offset(1,2))] // Make rounded corner of border
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                      ),
                      Image.asset('resources/images/onlinedelivery_20210504191855.jpg')

                    ],
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  SizedBox(
                    height: heightOfScreen * 0.45,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(42),
                    child: _form(),
                  ),

                ],
              ),

            ],
          ),
        )
      ),
    );
  }
  Widget _form(){
    return Form(
      child: Column(
        children: [
          GlobalInputFormWidget(
            controller: _username,
            validator: Validator.phone,
            textInputType: TextInputType.phone,
            title: 'Vui lòng nhập tên đăng nhập',
            hint: 'Vui lòng nhập số điện thoại',
          ),
          const SizedBox(
            height: 20,
          ),
          GlobalInputFormWidget(
            controller: _password,
            validator: Validator.password,
            textInputType: TextInputType.visiblePassword,
            title: 'Mật khẩu',
            hint: 'Vui lòng nhập mật khẩu',
            security: true,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 87),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(54),
                  ),
                  primary: UIColors.black70, // background
                  onPrimary: Colors.white,
                  // foreground
                ),
                onPressed: _onLogin,
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Đăng nhập',style: TextStyle(
                      color: UIColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _onLogin() async {
    setState(() {
      isCreating = true;
    });
    if (_username.text != '' && _password.text != '') {
      UserLogin userLogin = UserLogin(
        username: _username.text,
        password: _password.text,
      );

      UserResponse? retrievedUser = await _dioClient.login(userLogin: userLogin);
      if (retrievedUser!=null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()));
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Đăng nhập thành công'),
                  ],
                ),
              ),
            ),
          ),
        );
      }else{
        return;
      }
    }
    // setState(() {
    //   isCreating = false;
    // });
  }
}
