import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? userId;

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }
}

class DriverIdProvider extends ChangeNotifier {
  String? driverId;

  void setDriverId(String id) {
    driverId = id;
    notifyListeners();
  }
}
