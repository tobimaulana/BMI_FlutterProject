import '../constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    // Rumus BMI -> BMI = berat (dalam kg) / tinggi (dalam m) dikuadratkan
    double heightInMeter = height! / 100;
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;
    return bmi!;
  }

  // Buat fungsi u/ menentukan kategori hasil perhitungan BMI
  // Menerima masukan berupa double
  String determineBmiCategory(double bmiValue) {
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

    bmiCategory = category;

    return bmiCategory!;
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
    bmiDescription = desc;
    return desc;
  }

}