import 'package:body_mass_index/helpers/bmi_calculator.dart';
import 'package:body_mass_index/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
    // this.bmiCalculator,
  }) : super(key: key);

  // Menerima masukan dari fungsi lain
  // Variabel bmi -> berupa hasil hitung
  // Kemudian tambahkan variabel bmi ke parameter disamping key
  final double bmi;

  // final BmiCalculator? bmiCalculator;

  // Buat fungsi u/ menentukan kategori hasil perhitungan BMI
  // Menerima masukan berupa double
  /*String determineBmiCategory(double bmiValue) {
      // Nilai akan disimpan sementara sbg variabel lokal
      String category = "";

      if (bmiValue < 16.0) {
        category = underweightSevere;
      }

      else if (bmiValue < 17) {
        category = underweightModerate;
      }

      else if (bmiValue < 18.5) {
        category = underweightMild;
      }

      else if (bmiValue < 25.0) {
        category = normal;
      }

      else if (bmiValue < 30.0) {
        category = overweight;
      }

      else if (bmiValue < 35.0) {
        category = obese1;
      }

      else if (bmiValue < 40.0) {
        category = obese2;
      }

      else if (bmiValue >= 40.0) {
        category = obese3;
      }

      return category;
  }

  String getHealthRiskDescription(String categoryName) {
    String desc = "";
    switch(categoryName) {
      case underweightSevere :
      case underweightModerate :
      case underweightMild :
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal :
        desc = "Low risk (healthy range).";
        break;
      case overweight :
        desc = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obese1 :
      case obese2 :
      case obese3 :
        desc = "High risk of developing heart disease, high blood pressure, diabetes mellitus, and metabolic syndrome.";
        break;
      default :
    }
    return desc;
  }
*/
  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // final bmiCategory =
    bmiCalculator.determineBmiCategory();
    // final bmiDesc =
    bmiCalculator.getHealthRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung Indeks Massa Tubuh"),
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
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                // Sebenarnya bisa sj pakai expanded u/ membagi sama rata,
                // Tapi jika tdk ada keperluan khusus, bisa gunakan :
                // MainAxisAlignment.spaceEvenly
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(bmiCalculator.bmiCategory ?? "",
                  style: const TextStyle(
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
                  Text(
                    bmiCalculator.bmiDescription ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
