import 'package:bike_app/model/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String vehicleNumber = '';
  String selectedBrand = 'Bmw';
  String selectedType = 'Bike';
  String selectedFuelType = 'Petrol';

  final List<String> vehicleBrand = [
    'Bmw',
    'Suzuki',
    'Ferrari',
    'Ford',
    'Kawasaki'
  ];
  final List<String> vehicleType = [
    'Bike',
    'Car',
  ];
  final List<String> vehicleFuel = [
    'Petrol',
    'Diesel',
  ];

  final TextEditingController vehicleNumberController = TextEditingController();
  void _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('vehicleNumber', vehicleNumberController.text);
    prefs.setString('selectedBrand', selectedBrand);
    prefs.setString('selectedType', selectedType);
    prefs.setString('selectedFuelType', selectedFuelType);
  }

  // Load from SharedPreferences
  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      vehicleNumber = prefs.getString('vehicleNumber') ?? '';
      selectedBrand = prefs.getString('selectedBrand') ?? 'Bmw';
      selectedType = prefs.getString('selectedType') ?? 'Bike';
      selectedFuelType = prefs.getString('selectedFuelType') ?? 'Petrol';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    void submitForm() {
      AppProvider appProvider =
          Provider.of<AppProvider>(context, listen: false);

      Vehicle vehicle = Vehicle(
        vehicleNumber: vehicleNumberController.text,
        brand: selectedBrand,
        type: selectedType,
        fuelType: selectedFuelType,
      );
      appProvider.addVehicle(vehicle);
      appProvider.printVehicleList();
    }

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          title: const Text(
            "Vehicle Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 110, 187, 231),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "Vehicle Number",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: vehicleNumberController,
                style: const TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  labelText: 'Enter your text',
                  hintText: 'Vehicle Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "Brand Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedBrand,
                icon: Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                ),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).canvasColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBrand = newValue!;
                  });
                },
                items: vehicleBrand.map((String brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "Vehicle Type",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedType,
                icon: Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                ),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).canvasColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue!;
                  });
                },
                items: vehicleType.map((String brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Text(
              "Vehicle Type",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedFuelType,
                icon: Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                ),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).canvasColor,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFuelType = newValue!;
                  });
                },
                items: vehicleFuel.map((String brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.12,
            ),
            ElevatedButton(
              onPressed: () {
                submitForm();
                _saveToPrefs();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                  foregroundColor: Colors.white,
                  minimumSize: Size(screenWidth - 40, 45)),
              child: const Text("Add"),
            )
          ],
        )),
      ),
    );
  }
}
