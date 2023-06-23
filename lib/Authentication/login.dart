import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:usama/Authentication/forgotPassword/forgot_password.dart';
import 'package:usama/UcpRideMain/home.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/providers/user_provider.dart';
import 'package:usama/widgets/clickable_text.dart';
import 'package:usama/widgets/custom_button.dart';
import 'package:usama/widgets/text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> loginUser(String email, String password) async {
    setState(() {
      isLoading = true;
    });

    var url = Uri.parse('https://ucp-ride.onrender.com/api/user/login');
    var body = jsonEncode({'email': email, 'password': password});

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // Login successful
      // Navigate to the home page or perform any necessary actions
      // ignore: use_build_context_synchronously
      // Login successful
      // Save the _id to the UserProvider
      // ignore: use_build_context_synchronously
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final id = jsonDecode(response.body)['data']['emailExists']['_id'];
      // print(id);
      userProvider.setUserId(id);

      // Navigate to the home page or perform any necessary actions
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Login failed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Login Failed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: const Text(
              'Email or password is wrong. Please try again.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ucpbg.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  right: 25,
                  left: 25,
                ),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'UCP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
                                    color: AppColor.pri1maryColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' RIDE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: AppColor.pri2maryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Sign in ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: AppColor.pri1maryColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' to continue...',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: AppColor.pri2maryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'registration',
                        hint: 'Enter your email address',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        textInputType: TextInputType.emailAddress,
                        textcontoller: emailController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        name: 'password',
                        hint: 'Password',
                        isPass: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        textInputType: TextInputType.visiblePassword,
                        textcontoller: passwordController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ClickableText(
                          name: 'Forgot Password?',
                          fontsize: 12,
                          color: AppColor.dividerColor,
                          underline: false,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotPassword(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        type: ButtonVariant.filled,
                        color: AppColor.pri2maryColor,
                        buttonName: 'Log In',
                        width: 400,
                        height: 50,
                        onPressed: () {
                          String email = emailController.text;
                          String password = passwordController.text;
                          loginUser(email, password);
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColor.primarybackgroundColor,
                          ),
                          children: [
                            TextSpan(
                              text: ' SignUp',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: AppColor.pri2maryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'register');
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
