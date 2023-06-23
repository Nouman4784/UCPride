import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:usama/Authentication/pin_screen.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_button.dart';
import 'package:usama/widgets/text_field.dart';
// ignore: depend_on_referenced_packages
import 'package:email_validator/email_validator.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser(
      String email, String password, String phoneNo, String name) async {
    setState(() {
      isLoading = true;
    });

    if (password.length < 8) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Password'),
            content: const Text('Password should have 8 or more characters.'),
            actions: <Widget>[
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
      setState(() {
        isLoading = false;
      });
      return;
    }

    if (phoneNo.length != 11) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Invalid Phone Number',
            ),
            content: const Text('Phone number should have 11 digits.'),
            actions: <Widget>[
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
      setState(() {
        isLoading = false;
      });
      return;
    }

    var url = Uri.parse('https://ucp-ride.onrender.com/api/user/register');
    final body = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "phoneNo": phoneNo
    });
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url, body: body, headers: headers);
      // ignore: avoid_print
      print(response.body);
      if (response.statusCode == 200) {
        // Registration successful
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text(
                  'User created successfully. Please enter your OTP.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Send OTP'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PinVerify(),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Registration failed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Error',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              content: const Text(
                'Registration failed due to some invalid value. Please try again.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              actions: <Widget>[
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
    } catch (error) {
      // Error occurred while making the API call
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An error occurred. Please try again later.'),
            actions: <Widget>[
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

    setState(() {
      isLoading = false;
    });
  }

  bool validateEmail(String email) {
    if (!EmailValidator.validate(email)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Email'),
            content: const Text('Please enter a valid email address.'),
            actions: <Widget>[
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
      return false;
    }
    if (!email.endsWith('@ucp.edu.pk')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Email Domain'),
            content: const Text(
                'Email address must belong to the ucp.edu.pk domain.'),
            actions: <Widget>[
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
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ucpbg.gif'), fit: BoxFit.cover)),
      child: Scaffold(
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
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo.png'),
                                fit: BoxFit.cover),
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
                          text: 'Sign up ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: AppColor.pri1maryColor,
                          ),
                          children: [
                            TextSpan(
                              text: ' to explore a new journey...',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColor.pri2maryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'name',
                        hint: 'Write your name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColor.pri1maryColor,
                        ),
                        textcontoller: nameController,
                        textInputType: TextInputType.text,
                        validatorFtn: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'email',
                        hint: 'Write your UCP email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColor.pri1maryColor,
                        ),
                        textcontoller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validatorFtn: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email.';
                          }
                          if (!validateEmail(value)) {
                            return 'Please enter a valid email address.';
                          }

                          final emailComponents = value.split('@');
                          final localPart = emailComponents[0];

                          if (!localPart.contains(RegExp('L1|F|S'))) {
                            return 'Email should contain L1, F, or S in the local part before the @ symbol.';
                          }

                          if (!localPart.contains(RegExp(r'[0-9]'))) {
                            return 'Email should contain a number in the local part before the @ symbol.';
                          }

                          if (!localPart.contains(RegExp('BS|MS'))) {
                            return 'Email should contain BS or MS in the local part before the @ symbol.';
                          }

                          if (!RegExp(r'[0-9]{4}$').hasMatch(localPart)) {
                            return 'Email should end with four digits (e.g., 0123) in the local part before the @ symbol.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'password',
                        hint: 'Create your password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColor.pri1maryColor,
                        ),
                        isPass: true,
                        textcontoller: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        validatorFtn: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password.';
                          }
                          if (value.length < 8) {
                            return 'Password should have 8 or more characters.';
                          }
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return 'Password should include at least one capital letter.';
                          }
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return 'Password should include at least one number.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'phone',
                        hint: 'Enter your phone number',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: AppColor.pri1maryColor,
                        ),
                        textcontoller: phoneController,
                        textInputType: TextInputType.phone,
                        validatorFtn: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number.';
                          }
                          if (value.length != 11) {
                            return 'Phone number should have 11 digits.';
                          }
                          if (!value.startsWith('03')) {
                            return 'Phone number should start with 03.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      isLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              type: ButtonVariant.filled,
                              color: AppColor.pri2maryColor,
                              buttonName: 'Register',
                              width: 400,
                              height: 50,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password =
                                      passwordController.text.trim();
                                  String name = nameController.text.trim();
                                  String phoneNo = phoneController.text.trim();
                                  registerUser(email, password, phoneNo, name);
                                }
                              },
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColor.pri1maryColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'Login here',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.pri2maryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'login');
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
          ],
        ),
      ),
    );
  }
}
