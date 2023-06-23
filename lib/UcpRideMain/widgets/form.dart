import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:usama/config/appcolors.dart';
import 'package:usama/providers/user_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController departureLocationController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController noOfSeatsController = TextEditingController();
  bool isLoading = false; // Track loading state

  Future<void> addDriver(String departureLocation, String vehicleType,
      int noOfSeats, String userId) async {
    setState(() {
      isLoading = true; // Set loading state to true
    });

    var url = Uri.parse('https://ucp-ride.onrender.com/api/drivers/driver');
    var body = jsonEncode({
      'departureLocation': departureLocation,
      'vehicleType': vehicleType,
      'noOfSeats': noOfSeats,
      'userId': userId,
    });

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    setState(() {
      isLoading = false; // Set loading state to false
    });

    if (response.statusCode == 200) {
      // Driver added successfully
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            content: const Text(
              'Driver added successfully.',
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
    } else {
      // Adding driver failed
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
              'Something went wrong. Please try again.',
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
          image: AssetImage('assets/gradientbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              // color: AppColor.primarybackgroundColor,
            ),
          ),
          elevation: 4,
          centerTitle: true,
          shadowColor: AppColor.hintTextColor,
          backgroundColor: AppColor.appbarColor,
          title: const Text(
            'Create your Trip',
            style: TextStyle(
              // color: AppColor.primarybackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Customize your trip',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: ' with UCP RIDE',
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
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Arrival location',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: departureLocationController,
                      decoration: const InputDecoration(
                        hintText: 'Enter arrival location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Mode of transportation',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: vehicleTypeController,
                      decoration: const InputDecoration(
                        hintText: 'Bike or Car',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'No of seats',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: noOfSeatsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Enter no of seats',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.red,
                        // ignore: deprecated_member_use
                        onPrimary: Colors.white,
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        String departureLocation =
                            departureLocationController.text;
                        String vehicleType = vehicleTypeController.text;
                        int noOfSeats = int.parse(noOfSeatsController.text);
                        String? userId =
                            Provider.of<UserProvider>(context, listen: false)
                                .userId;

                        addDriver(
                          departureLocation,
                          vehicleType,
                          noOfSeats,
                          userId!,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            if (isLoading) // Show loader when isLoading is true
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
