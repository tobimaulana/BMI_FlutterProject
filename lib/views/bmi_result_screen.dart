import 'package:body_mass_index/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);

  // Menerima masukan dari fungsi lain
  // Variabel bmi -> berupa hasil hitung
  // Kemudian tambahkan variabel bmi ke parameter disamping key
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        const Expanded(child: Center(
          child: Text(
            "Hasil Perhitungan",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                // Sebenarnya bisa sj pakai expanded u/ membagi sama rata,
                // Tapi jika tdk ada keperluan khusus, bisa gunakan :
                // MainAxisAlignment.spaceEvenly
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Normal",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                  Text(bmi.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )),
                  const Text(
                    "Your BMI result is quite low, you should eat more!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  ),),
                ],
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            // Navigator.pop untuk kembali ke halaman input data
            Navigator.pop(context);
          },
          child: Container(
            height: 80,
            color: Colors.amber,
            child: const Center(
              child: Text(
                "Hitung Ulang",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            ),
          ),
        )

      ],),
    );
  }
}
