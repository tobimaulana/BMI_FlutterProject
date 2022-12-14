import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            color: Colors.red,
          )),
          Expanded(child: Container(
            color: Colors.yellow,
          )),
          Expanded(child: Container(
            color: Colors.green,
          )),
          Container(
            height: 60,
            color: Colors.deepPurpleAccent,
            child: const Center(child: Text("Hitung BMI")),
          )
        ],
      ),
    );
  }
}
