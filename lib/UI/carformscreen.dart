// import 'package:bike_app/model/vehicle_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CarFormScreen extends StatefulWidget {
//   const CarFormScreen({super.key});

//   @override
//   State<CarFormScreen> createState() => _CarFormScreenState();
// }

// class _CarFormScreenState extends State<CarFormScreen> {
//   String vehicleNumber = '';
//   String selectedBrand = 'Honda';
//   String selectedType = 'Sport Bikes';
//   String selectedFuelType = 'Type A';

//   final List<String> bikeBrands = [
//     'Honda',
//     'Yamaha',
//     'Ducati',
//     'Harley-Davidson',
//     'Kawasaki'
//   ];
//   final List<String> bikeTypes = [
//     'Sport Bikes',
//     'Cruiser Bikes',
//     'Touring Bikes',
//     'Dirt Bikes',
//     'Standard Bikes'
//   ];
//   final List<String> bikeFuels = [
//     'Type A',
//     'Type B',
//     'Type C',
//     'Type D',
//     'Type E',
//   ];

//   final TextEditingController vehicleNameController = TextEditingController();
//   void _saveToPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('vehicleNumber', vehicleNameController.text);
//     prefs.setString('selectedBrand', selectedBrand);
//     prefs.setString('selectedType', selectedType);
//     prefs.setString('selectedFuelType', selectedFuelType);
//   }

//   // Load from SharedPreferences
//   void _loadFromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       vehicleNumber = prefs.getString('vehicleNumber') ?? '';
//       selectedBrand = prefs.getString('selectedBrand') ?? 'Honda';
//       selectedType = prefs.getString('selectedType') ?? 'Sport Bikes';
//       selectedFuelType = prefs.getString('selectedFuelType') ?? 'Type A';
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadFromPrefs();
//   }

//   @override
//   Widget build(BuildContext context) {
//     void submitForm() {
//       AppProvider appProvider =
//           Provider.of<AppProvider>(context, listen: false);

//       Cars car = Cars(
//         carNumber: vehicleNameController.text,
//         carBrand: selectedBrand,
//         carType: selectedType,
//         carFuelType: selectedFuelType,
//       );
//       appProvider.addCar(car);
//       appProvider.printVehicleList();
//     }

//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return ChangeNotifierProvider(
//       create: (context) => AppProvider(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SafeArea(
//             child: Column(
//           children: [
//             Container(
//               height: 60,
//               color: Colors.amberAccent,
//               child: const Center(
//                   child: Text(
//                 "Vehicle Details",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold),
//               )),
//             ),
//             SizedBox(
//               height: screenHeight * 0.03,
//             ),
//             const Text(
//               "Vehicle Number",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: TextFormField(
//                 controller: vehicleNameController,
//                 style: const TextStyle(fontSize: 18.0),
//                 decoration: InputDecoration(
//                   labelText: 'Enter your text',
//                   hintText: 'Vehicle Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6.0),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: screenHeight * 0.03,
//             ),
//             const Text(
//               "Brand Name",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 value: selectedBrand,
//                 icon: Icon(Icons.arrow_drop_down,
//                     color: Theme.of(context).primaryColor),
//                 iconSize: 24,
//                 elevation: 16,
//                 style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 18.0,
//                 ),
//                 underline: Container(
//                   height: 2,
//                   color: Theme.of(context).canvasColor,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedBrand = newValue!;
//                   });
//                 },
//                 items: bikeBrands.map((String brand) {
//                   return DropdownMenuItem<String>(
//                     value: brand,
//                     child: Text(brand),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(
//               height: screenHeight * 0.03,
//             ),
//             const Text(
//               "Vehicle Type",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 value: selectedType,
//                 icon: Icon(Icons.arrow_drop_down,
//                     color: Theme.of(context).primaryColor),
//                 iconSize: 24,
//                 elevation: 16,
//                 style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 18.0,
//                 ),
//                 underline: Container(
//                   height: 2,
//                   color: Theme.of(context).canvasColor,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedType = newValue!;
//                   });
//                 },
//                 items: bikeTypes.map((String brand) {
//                   return DropdownMenuItem<String>(
//                     value: brand,
//                     child: Text(brand),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(
//               height: screenHeight * 0.03,
//             ),
//             const Text(
//               "Vehicle Type",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: DropdownButton<String>(
//                 isExpanded: true,
//                 value: selectedFuelType,
//                 icon: Icon(Icons.arrow_drop_down,
//                     color: Theme.of(context).primaryColor),
//                 iconSize: 24,
//                 elevation: 16,
//                 style: TextStyle(
//                   color: Theme.of(context).primaryColor,
//                   fontSize: 18.0,
//                 ),
//                 underline: Container(
//                   height: 2,
//                   color: Theme.of(context).canvasColor,
//                 ),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedFuelType = newValue!;
//                   });
//                 },
//                 items: bikeFuels.map((String brand) {
//                   return DropdownMenuItem<String>(
//                     value: brand,
//                     child: Text(brand),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(
//               height: screenHeight * 0.12,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 submitForm();
//                 _saveToPrefs();
//               },
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   backgroundColor: Colors.blueAccent,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(screenWidth - 40, 45)),
//               child: const Text("Add"),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
