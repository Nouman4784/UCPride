import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:usama/Authentication/login.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/clickable_text.dart';
import 'package:usama/widgets/custom_button.dart';

class PinVerify extends StatefulWidget {
  const PinVerify({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PinVerifyState createState() => _PinVerifyState();
}

class _PinVerifyState extends State<PinVerify> {
  @override
  Widget build(BuildContext context) {
    bool verifiedCheck = false;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/gradientbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
          elevation: 4,
          shadowColor: Colors.grey,
          backgroundColor: Colors.white,
          title: const Text(
            'Reset password',
            style: TextStyle(
              color: Color.fromARGB(255, 85, 84, 84),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: "verification code",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          )),
                      TextSpan(
                        text:
                            ' has been sent to the number linked to your account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Please enter the code below.',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              verifiedCheck
                  // ignore: dead_code
                  ? Center(
                      child: SizedBox(
                        height: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Number verified',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Pinput(
                            length: 4,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            defaultPinTheme: PinTheme(
                              height: 50,
                              width: 70,
                              textStyle: const TextStyle(fontSize: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 100,
              ),
              verifiedCheck
                  // ignore: dead_code
                  ? GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, AppRoutes.newPassword);
                      },
                      child: const CustomButton(
                        type: ButtonVariant.filled,
                        color: Colors.grey,
                        buttonName: 'Continue',
                        height: 50,
                        width: 450,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyLogin(),
                          ),
                        );
                        setState(() {
                          verifiedCheck = true;
                        });
                      },
                      child: CustomButton(
                        type: ButtonVariant.filled,
                        color: AppColor.pri2maryColor,
                        buttonName: 'Verify',
                        height: 50,
                        width: 450,
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Didn't recieve anything?",
                  style: TextStyle(
                    color: verifiedCheck ? Colors.grey : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              verifiedCheck
                  ? const Center(
                      child: ClickableText(
                        name: "Resend Code",
                        underline: false,
                        color: Colors.grey,
                        fontsize: 16,
                      ),
                    )
                  : Center(
                      child: ClickableText(
                        onPressed: () {},
                        name: "Resend Code",
                        weight: FontWeight.bold,
                        underline: false,
                        color: Colors.grey,
                        fontsize: 16,
                      ),
                    ),
            ],
          ),
        ),
        // bottomNavigationBar: SizedBox(
        //   height: 50,
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Padding(
        //       padding: const EdgeInsets.only(bottom: 30),
        //       child: ClickableText(
        //         onPressed: () {},
        //         name: 'Cancel',
        //         color: Colors.grey,
        //         underline: false,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
