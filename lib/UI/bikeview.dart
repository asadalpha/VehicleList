import 'package:bike_app/UI/card.dart';
import 'package:bike_app/UI/vehicleformscreen.dart';
import 'package:bike_app/model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BikeScreen extends StatelessWidget {
  final String vehicleType;
  const BikeScreen({super.key, required this.vehicleType});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Consumer<AppProvider>(
            builder: (context, appProvider, child) {
              List<Vehicle> bikeList = appProvider.vehicleList
                  .where((vehicle) => vehicle.type == vehicleType)
                  .toList();

              return ListView.builder(
                itemCount: bikeList.length,
                itemBuilder: (context, index) {
                  Vehicle vehicle = bikeList[index];

                  return CustomCard(
                    vehicleNo: vehicle.vehicleNumber,
                    brandName: vehicle.brand,
                    vehicleType: vehicle.type,
                    fuelType: vehicle.fuelType,
                    onDelete: () {
                      Provider.of<AppProvider>(context, listen: false)
                          .removeVehicle(index);
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
