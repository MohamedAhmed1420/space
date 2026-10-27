import 'package:flutter/material.dart';
import 'package:space/core/theme/app_theme.dart';
import 'package:space/modules/home/homescreen.dart';
import 'package:space/modules/login/loginscreen.dart';

import 'modules/decscretionscreen/descscreen.dart';

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
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DescScreen.routeName: (context) => DescScreen(),
      },

      theme: AppTheme.appTheme,
      home: LoginScreen(),
    );
  }
}
