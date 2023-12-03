import 'package:flutter/material.dart';
import 'package:untitled5/config/component/themedata.dart';
import 'package:untitled5/pages/signup_page/signup_screen.dart';

import 'pages/login_page/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignupScreen.routeName,
      routes: {
        LoginScreen.routeName : (context) => LoginScreen(),
        SignupScreen.routeName : (context) => SignupScreen(),
      },
      theme: MyThemeData.lightTheme,
      // themeMode: ThemeMode.light,
    );
  }
}

