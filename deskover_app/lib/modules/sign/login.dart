import 'package:deskover_app/client/dio_client.dart';
import 'package:deskover_app/api/sign/login_resquest.dart';
import 'package:deskover_app/api/user_info.dart';
import 'package:deskover_app/api/sign/response/user_response.dart';
import 'package:deskover_app/api/widget/create.dart';
import 'package:deskover_app/modules/main_page/home_page.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.white,
        title: const Text('Mutosi IOT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(hintText: 'Enter name'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(hintText: 'Enter job'),
            ),
            const SizedBox(height: 16.0),
            isCreating
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
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

                        }
                      }
                      setState(() {
                        isCreating = false;
                      });
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
