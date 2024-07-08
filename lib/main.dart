import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            color: Colors.black, // Background color for the title
            padding: const EdgeInsets.all(9.0), // Padding
            child: const Text(
              'Nandini A00183741',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),),),
        backgroundColor: Colors.lightBlueAccent,
        body: const Center(
          child: Text(
            'HELLO WORLD!',
            style: TextStyle(fontSize: 30, color: Colors.purple, fontWeight: FontWeight.bold),
          ),),),);
  }
}
