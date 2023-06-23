import 'package:flutter/material.dart';
import 'package:usama/Authentication/forgotPassword/password_resseted.dart';
import 'package:usama/Authentication/forgotPassword/widgets/password_checker.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_button.dart';
import 'package:usama/widgets/text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _isMatched = false;
  // ignore: prefer_final_fields, unused_field
  bool _isVisibal = false;
  // ignore: prefer_final_fields, unused_field
  bool _isVisibleConfirmed = false;
  bool oneLetter = false;
  bool oneCapitalLetter = false;
  bool oneNumber = false;
  bool atleastEight = false;

  passwordValidation(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final capitalLetterRegex = RegExp(r'[A-Z]');
    final smallLetterRegex = RegExp(r'[a-z]');

    setState(() {
      atleastEight = false;
      if (password.length >= 8) {
        atleastEight = true;
      }
      oneNumber = false;
      if (numericRegex.hasMatch(password)) {
        oneNumber = true;
      }
      oneCapitalLetter = false;
      if (capitalLetterRegex.hasMatch(password)) {
        oneCapitalLetter = true;
      }
      oneLetter = false;
      if (smallLetterRegex.hasMatch(password)) {
        oneLetter = true;
      }
      _isMatched = false;
      if (_confirmPass.text == password) {
        _isMatched = true;
      }
    });
  }

  confirmpassword(String value) {
    setState(() {
      _isMatched = false;
      if (_pass.text == value) {
        _isMatched = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gradientbg.png'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          shadowColor: AppColor.hintTextColor,
          backgroundColor: AppColor.appbarColor,
          title: Text(
            'New Password',
            style: TextStyle(
              color: AppColor.primarybackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: 25,
                    left: 25),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Please enter your new password...',
                        style: TextStyle(
                          color: AppColor.pri1maryColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTextField(
                        name: 'password',
                        hint: 'Password',
                        isPass: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTextField(
                        name: 'confirm password',
                        hint: 'Confirm Password',
                        isPass: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text('Password Requirements:'),
                      const SizedBox(
                        height: 20,
                      ),
                      CheckerRow(text: 'At least one letter', check: oneLetter),
                      const SizedBox(
                        height: 10,
                      ),
                      CheckerRow(
                          text: 'At least one capital letter',
                          check: oneCapitalLetter),
                      const SizedBox(
                        height: 10,
                      ),
                      CheckerRow(text: 'At least one number', check: oneNumber),
                      const SizedBox(
                        height: 10,
                      ),
                      CheckerRow(
                          text: 'At least 8 characters', check: atleastEight),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 60,
            child: _isMatched
                ? GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacementNamed(
                      //     context, AppRoutes.passwordResetted);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordResetted(),
                          ));
                    },
                    child: CustomButton(
                      type: ButtonVariant.filled,
                      color: AppColor.pri1maryColor,
                      buttonName: "Reset password",
                      height: 50,
                      width: 450,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordResetted(),
                          ));
                      // Navigator.pushReplacement
                      // Named(
                      //     context, AppRoutes.passwordResetted);
                    },
                    child: CustomButton(
                      type: ButtonVariant.filled,
                      color: AppColor.pri2maryColor,
                      buttonName: "Reset password",
                      height: 50,
                      width: 450,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
