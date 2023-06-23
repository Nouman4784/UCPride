import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:usama/UcpRideMain/passenger/confirmation.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_tile.dart';

class DriversDisplay extends StatefulWidget {
  const DriversDisplay({Key? key}) : super(key: key);

  @override
  State<DriversDisplay> createState() => _DriversDisplayState();
}

class _DriversDisplayState extends State<DriversDisplay> {
  List<Map<String, String>> customTilesData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://ucp-ride.onrender.com/api/drivers/driver'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final data = jsonResponse['data'] as List<dynamic>;
        setState(() {
          customTilesData = data.map<Map<String, String>>((item) {
            return {
              '_id': item['_id'],
              'title': 'Arrival Location: ${item['departureLocation'] ?? ''}',
              'arrivalTime': 'Time: ${item['date'] ?? ''}',
              'departureLocation': 'Area: ${item['departureLocation'] ?? ''}',
              'madeOfTransportation': 'Vehicle: ${item['vehicleType'] ?? ''}',
              'noOfSeats': 'No Of Seats: ${item['noOfSeats'] ?? ''}',
            };
          }).toList();
          isLoading = false; // Data fetching is complete
        });
      } else {
        setState(() {
          isLoading = false; // Data fetching failed
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false; // Data fetching failed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/gradientbg.png'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.primarybackgroundColor,
            ),
          ),
          elevation: 4,
          centerTitle: true,
          shadowColor: AppColor.hintTextColor,
          backgroundColor: AppColor.appbarColor,
          title: Text(
            'Choose Your Driver',
            style: TextStyle(
              color: AppColor.primarybackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Choose your driver',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: AppColor.pri1maryColor,
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
                    height: 10,
                  ),
                  isLoading
                      ? const CircularProgressIndicator() // Show loader while fetching data
                      : Column(
                          children: customTilesData
                              .map(
                                (data) => CustomTile(
                                  title: data['title']!,
                                  arrivalTime: data['arrivalTime']!,
                                  departureLocation: data['departureLocation']!,
                                  madeOfTransportation:
                                      data['madeOfTransportation']!,
                                  noOfSeats: data['noOfSeats']!,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ConfirmationScreen(),
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
