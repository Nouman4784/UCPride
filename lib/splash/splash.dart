import 'dart:async';
import 'package:flutter/material.dart';
import 'package:usama/Authentication/login.dart';
import 'package:usama/config/appcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyLogin(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/gradientbg.png'),
                  fit: BoxFit.cover)),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'UCP',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 45,
                    color: AppColor.pri1maryColor,
                  ),
                  children: [
                    TextSpan(
                      text: 'RIDE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: AppColor.pri2maryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
