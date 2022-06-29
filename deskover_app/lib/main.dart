import 'package:deskover_app/api/data.dart';
import 'package:deskover_app/client/dio_client.dart';
import 'package:deskover_app/api/user.dart';
import 'package:deskover_app/api/widget/create.dart';
import 'package:deskover_app/modules/sign/login.dart';
import 'package:deskover_app/modules/splashcreen/splashscreen.dart';
import 'package:deskover_app/themes/themes.dart';
import 'package:deskover_app/themes/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main()  {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> loading() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Mutosi App',
      theme: Themes.mainTheme,
      home: SplashScreen(action: loading, nextScreen: const Login()),
    );
  }
}




