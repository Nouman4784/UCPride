import 'package:flutter/material.dart';
import 'package:usama/Authentication/forgotPassword/forgot_password.dart';
import 'package:usama/Authentication/login.dart';
import 'package:usama/Authentication/register.dart';
import 'package:usama/UcpRideMain/home.dart';
import 'package:usama/providers/user_provider.dart';
import 'package:usama/splash/splash.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'UCP ride',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => const SplashScreen(),
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'forgotpassword': (context) => const ForgotPassword(),
          'home': (context) => const HomePage(),
        },
      ),
    ),
  );
}
