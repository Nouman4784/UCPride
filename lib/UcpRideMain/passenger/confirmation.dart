import 'dart:async';
import 'package:flutter/material.dart';
import 'package:usama/UcpRideMain/home.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ConfirmationScreen> {
  // TextEditingController messageTC = TextEditingController();
  // Map<String, dynamic>? responseData;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // Future<void> fetchData() async {
  //   try {
  //     String id = widget.id;
  //     final response = await http.post(
  //       Uri.parse('https://ucp-ride.onrender.com/api/drivers/driverById'),
  //       body: {'_id': id},
  //     );
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       final data = jsonResponse['data'];
  //       setState(() {
  //         responseData = data;
  //       });
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       print(response.body);
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'You have thirty minutes\nto connect\nwith the driver.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
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
                  const Text(
                    'Have a Safe Journey!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
