import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:usama/UcpRideMain/acoount/account.dart';
import 'package:usama/UcpRideMain/passenger/drivers_display.dart';
import 'package:usama/UcpRideMain/widgets/form.dart';
import 'package:usama/config/appcolors.dart';
import 'package:usama/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LatLng initialPosition = const LatLng(31.4469, 74.2682);
  final List<LatLng> markerPositions = [
    const LatLng(31.4470, 74.2682),
    const LatLng(31.4469, 74.2683),
    const LatLng(31.446913, 74.268050),
    const LatLng(31.446816, 74.268275),
    const LatLng(31.446896, 74.268015),
    const LatLng(31.446764, 74.268235),
    const LatLng(31.446909, 74.268037),
    const LatLng(31.447019, 74.268150),
    const LatLng(31.446908, 74.268035),
    const LatLng(31.446770, 74.268217),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account()),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
        title: const Text(
          'UCP RIDE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppColor.appbarColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 20,
            ),
            markers: _buildMarkers(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 20, 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  CustomButton(
                    type: ButtonVariant.filled,
                    color: AppColor.pri2maryColor,
                    buttonName: 'Driver',
                    width: 150,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserForm(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    type: ButtonVariant.filled,
                    color: AppColor.pri2maryColor,
                    buttonName: 'Passenger',
                    width: 150,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DriversDisplay(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};

    for (int i = 0; i < markerPositions.length; i++) {
      LatLng markerPosition = markerPositions[i];
      markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: markerPosition,
        ),
      );
    }

    return markers;
  }
}
