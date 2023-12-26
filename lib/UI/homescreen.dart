import 'package:bike_app/UI/bikeview.dart';
import 'package:bike_app/UI/carview.dart';
import 'package:bike_app/UI/vehicleformscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Vehicle Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 110, 187, 231),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            const TabBar(
              tabs: [
                Tab(
                  text: "Bike",
                ),
                Tab(
                  text: "Car",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                BikeScreen(
                  vehicleType: 'Bike',
                ),
                CarScreen(
                  vehicleType: 'Car',
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FormScreen()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                    foregroundColor: Colors.white,
                    minimumSize: Size(screenWidth - 40, 45)),
                child: const Text("Add"),
              ),
            )
          ],
        )),
      ),
    );
  }
}
