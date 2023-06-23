import 'package:flutter/material.dart';
import 'package:usama/Authentication/forgotPassword/new_password.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_button.dart';
import 'package:usama/widgets/text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            'Reset Password',
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter your email address',
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextField(
                      name: 'Email',
                      hint: 'Usama@mail.com',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 60,
            child: GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, AppRoutes.verifyEmail);
              },
              child: CustomButton(
                type: ButtonVariant.filled,
                color: AppColor.pri2maryColor,
                buttonName: 'Continue',
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const NewPassword(),
                  //     ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewPassword()));
                },
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
