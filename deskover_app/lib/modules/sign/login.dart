import 'package:deskover_app/client/api_login.dart';
import 'package:deskover_app/api/sign/login_resquest.dart';
import 'package:deskover_app/api/user_info.dart';
import 'package:deskover_app/api/sign/response/user_response.dart';
import 'package:deskover_app/component/widget/global_input_form_widget.dart';
import 'package:deskover_app/constants/icon_assets.dart';
import 'package:deskover_app/modules/main_page/home_page.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:deskover_app/utils/AppUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  late final TextEditingController _username;
  late final TextEditingController _password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DioClient _dioClient = DioClient();
  bool isCreating = false;

  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    load();
    super.initState();
  }
  void load() async{
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('uToken');
    if(action != null){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
      );
    }
    print('Check Token Login'+ action!);
  }

  @override
  Widget build(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children:  <Widget>[
            Container(
              width: double.infinity,
              height: heightOfScreen,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IconAssets.brackgroundLogin),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: heightOfScreen*0.05,),
                  SizedBox(
                    height: heightOfScreen*0.35,
                    width: widthOfScreen,
                    child: Center(child: Image.asset('resources/icons/delivery.png',height: 400)),
                  ),
                  Image.asset('resources/icons/logo.png',width: 330,),
                  SvgPicture.asset('resources/icons/word.svg',color: UIColors.white,)
                ],
              ),
            ),

            ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                SizedBox(
                  height: heightOfScreen * 0.6,
                ),
                Container(
                  height: heightOfScreen * 0.5,
                  decoration: const BoxDecoration(
                      color: UIColors.white,// Set border width
                      borderRadius: BorderRadius.only( topLeft: Radius.circular(40),topRight: Radius.circular(40)
                      ), // Set rounded corner radius
                      boxShadow: [BoxShadow(blurRadius: 10,color: UIColors.black10,offset: Offset(1,2))] // Make rounded corner of border
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(42),
                    child: _form(),
                  ),
                ),

              ],
            ),

          ],
        )
      ),
    );
  }
  Widget _form(){
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            GlobalInputFormWidget(
              controller: _username,
              validator: Validator.username,
              textInputType: TextInputType.text,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(54),
                    ),
                    primary: UIColors.loginbuuton, // background
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
      ),
    );
  }
  void _onLogin() async{
    FocusManager.instance.primaryFocus?.unfocus();
    final prefs = await SharedPreferences.getInstance();
    if (!(formKey.currentState?.validate() ?? false)) {
      // not validate or null
      return;
    }
    UserLogin userLogin = UserLogin(
      username: _username.text,
      password: _password.text,
    );
    UserResponse? retrievedUser = await _dioClient.login(userLogin: userLogin);
    await prefs.setString('uToken', retrievedUser?.token ?? '');

    if (retrievedUser!=null) {
      setState(() {
        Get.to(() =>  HomePage());
      });
      return AppUtils().showPopup(
        title: 'Thông báo',
        subtitle: 'Đăng nhập thất thành công',
        isSuccess: true,
      );
    }
  }
}
