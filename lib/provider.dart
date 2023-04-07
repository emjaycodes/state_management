// // Importing the necessary packages
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // Defining the CounterModel class
// class CounterModel with ChangeNotifier {
// int _count = 0;
// int get count => _count;
// void incrementCount() {
// _count++;
// notifyListeners();
// }
// }

// // Defining the MyProviderApp class which wraps the MaterialApp widget with the ChangeNotifierProvider widget
// class MyProviderApp extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// return ChangeNotifierProvider(
// create: (_) => CounterModel(),
// child: MaterialApp(
// title: 'Provider Example',
// home: ProviderPage(),
// ),
// );
// }
// }

// // Defining the ProviderPage class which displays the current value of the counter and increments it when the user taps on it
// class ProviderPage extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// // Retrieving the current value of the counter from the CounterModel
// final count = context.watch<CounterModel>().count;

// less
// Copy code
// return Scaffold(
//   appBar: AppBar(
//     title: Text('Provider Example'),
//   ),
//   body: Center(
//     child: GestureDetector(
//       onTap: () {
//         // Incrementing the counter value
//         context.read<CounterModel>().incrementCount();
//       },
//       child: Text(
//         '$count', // Displaying the current value of the counter
//         style: TextStyle(fontSize: 24.0),
//       ),
//     ),
//   ),
// );
// }
// }

// // Defining the main function which runs the app
// void main() {
// runApp(MyProviderApp());
// }