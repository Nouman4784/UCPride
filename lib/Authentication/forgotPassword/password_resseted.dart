import 'package:flutter/material.dart';
import 'package:usama/Authentication/login.dart';
import 'package:usama/config/appcolors.dart';

class PasswordResetted extends StatefulWidget {
  const PasswordResetted({super.key});

  @override
  State<PasswordResetted> createState() => _PasswordResettedState();
}

class _PasswordResettedState extends State<PasswordResetted> {
  void _nextscreen() {
    Future.delayed(
      const Duration(seconds: 4),
      (() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyLogin(),
            ));
      }),
    );
  }

  @override
  void initState() {
    _nextscreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gradientbg.png'), fit: BoxFit.cover)),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add_reaction),
                Text(
                  'YOUR PASSWORD HAS BEEN RESET !!!',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.pri1maryColor,
                  ),
                ),
                Text(
                  'Returning to sign in screen',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.pri2maryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
