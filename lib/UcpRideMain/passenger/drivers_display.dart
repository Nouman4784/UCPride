import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usama/UcpRideMain/passenger/chat_screen.dart';
import 'package:usama/UcpRideMain/passenger/confirmation.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_button.dart';
import 'package:usama/widgets/custom_tile.dart';

class DriversDisplay extends StatefulWidget {
  const DriversDisplay({Key? key}) : super(key: key);

  @override
  State<DriversDisplay> createState() => _DriversDisplayState();
}

class _DriversDisplayState extends State<DriversDisplay> {
  List<Map<String, String>> customTilesData = [];
  bool isLoading = true;
  // late DriverDetailsPopup _driverDetailsPopup; // Declare the variable

  @override
  void initState() {
    super.initState();
    fetchData();
    // _driverDetailsPopup = DriverDetailsPopup(); // Initialize the variable
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
              'title': 'Departure Location: ${item['departureLocation'] ?? ''}',
              'arrivalTime': 'Time: ${item['date'] ?? ''}',
              'departureLocation':
                  'Arrival Location: ${item['arrivalLocation'] ?? ''}',
              'madeOfTransportation': 'Vehicle: ${item['vehicleType'] ?? ''}',
              'licenseNo': 'LicenseNo : ${item['licenseNo'] ?? ''}',
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
                      ? const CircularProgressIndicator()
                      : Column(
                          children: customTilesData.map(
                            (data) {
                              final driverId = data['_id'];
                              if (driverId != null) {
                                return CustomTile(
                                  title: data['title']!,
                                  departureLocation: data['departureLocation']!,
                                  arrivalTime: data['arrivalTime']!,
                                  madeOfTransportation:
                                      data['madeOfTransportation']!,
                                  licenseNo: data['licenseNo']!,
                                  noOfSeats: data['noOfSeats']!,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(data['title']!),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(data['departureLocation']!),
                                              Text(data[
                                                  'madeOfTransportation']!),
                                              Text(data['licenseNo']!),
                                              Text(data['noOfSeats']!),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomButton(
                                                buttonName: 'Start a chat',
                                                height: 50,
                                                width: 190,
                                                color: AppColor.pri1maryColor,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ChatScreen(),
                                                    ),
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Container(); // or any other placeholder widget
                              }
                            },
                          ).toList(),
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

// class DriverDetailsPopup extends StatefulWidget {
//   const DriverDetailsPopup({Key? key}) : super(key: key);

//   @override
//   _DriverDetailsPopupState createState() => _DriverDetailsPopupState();
// }

// class _DriverDetailsPopupState extends State<DriverDetailsPopup> {
//   Map<String, String>? driverDetails;
//   bool _isPopupVisible = false;

//   void showPopup(Map<String, String> data) {
//     setState(() {
//       driverDetails = data;
//       _isPopupVisible = true;
//     });
//   }

//   void hidePopup() {
//     setState(() {
//       _isPopupVisible = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isPopupVisible) {
//       return Container();
//     }

//     return Stack(
//       children: [
//         Container(
//           color: Colors.black54,
//         ),
//         Dialog(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text(driverDetails!['title']!),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(driverDetails!['departureLocation']!),
//                     Text(driverDetails!['arrivalTime']!),
//                     Text(driverDetails!['madeOfTransportation']!),
//                     Text(driverDetails!['licenseNo']!),
//                     Text(driverDetails!['noOfSeats']!),
//                   ],
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
