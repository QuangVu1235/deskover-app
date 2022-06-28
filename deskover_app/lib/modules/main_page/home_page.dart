import 'package:deskover_app/client/dio_client.dart';
import 'package:deskover_app/api/data.dart';
import 'package:deskover_app/api/user.dart';
import 'package:deskover_app/api/widget/create.dart';
import 'package:deskover_app/modules/sign/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Info'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body:TabBarView(
          children: <Widget>[
            Center(
              child: FutureBuilder<User?>(
                future: _client.getUser(id: '1'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    User? userInfo = snapshot.data;
                    if (userInfo != null) {
                      Data userData = userInfo.data;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(userData.avatar),
                          SizedBox(height: 8.0),
                          Text(
                            '${userInfo.data.firstName} ${userInfo.data.lastName}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            userData.email,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      );
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            CreateUser(),
            Login(),
          ],
        ),

      ),
    );
  }
}

class SigninSignupScreen extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SigninSignupScreen();

}
class _SigninSignupScreen extends State<SigninSignupScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}