import 'package:body_mass_index/views/bmi_result_screen.dart';
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
      backgroundColor: const Color(0xff12153B),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff3D416D),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: const [
                        Icon(Icons.male,
                            size: 70,color: Colors.white,
                        ),
                        Text("Male",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                            )
                        ),
                        ],
                      ),
                    ),
                  ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff3D416D),
                    borderRadius: BorderRadius.circular(15)
                    ),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.female,
                          size: 70,
                          color: Colors.white,
                      ),
                      Text("Female",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],)),
          Expanded(child: Container(
            color: Colors.yellow,
          )),
          Expanded(child: Container(
            color: Colors.green,
          )),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: ((context) {
                  return const BmiResultScreen();
                }),
                ),
              );
            },
            child: Container(
              height: 60,
              color: Colors.deepPurpleAccent,
              child: const Center(child: Text("Hitung BMI")),
            ),
          )
        ],
      ),
    );
  }
}
