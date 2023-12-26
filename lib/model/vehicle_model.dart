// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Vehicle {
  String vehicleNumber;
  String brand;
  String type;
  String fuelType;

  Vehicle({
    required this.vehicleNumber,
    required this.brand,
    required this.type,
    required this.fuelType,
  });
}



class AppProvider extends ChangeNotifier {
  final List<Vehicle> _vehicleList = [];

  List<Vehicle> get vehicleList => _vehicleList;


  void addVehicle(Vehicle vehicle) {
    _vehicleList.add(vehicle);
    notifyListeners();
  }

  

  void removeVehicle(int index) {
    _vehicleList.removeAt(index);
    notifyListeners();
  }

  

  void printVehicleList() {
    print('Vehicle List:');
    for (var vehicle in _vehicleList) {
      print('Vehicle Number: ${vehicle.vehicleNumber}');
      print('Brand: ${vehicle.brand}');
      print('Type: ${vehicle.type}');
      print('Fuel Type: ${vehicle.fuelType}');
      print('------------------');
    }
  }
}
