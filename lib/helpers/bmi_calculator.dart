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
  String determineBmiCategory() {
    // Nilai akan disimpan sementara sbg variabel lokal
    String category = "";

    if (bmi! < 16.0) {
      category = underweightSevere;
    }

    else if (bmi! < 17) {
      category = underweightModerate;
    }

    else if (bmi! < 18.5) {
      category = underweightMild;
    }

    else if (bmi! < 25.0) {
      category = normal;
    }

    else if (bmi! < 30.0) {
      category = overweight;
    }

    else if (bmi! < 35.0) {
      category = obese1;
    }

    else if (bmi! < 40.0) {
      category = obese2;
    }

    else if (bmi! >= 40.0) {
      category = obese3;
    }

    bmiCategory = category;

    return bmiCategory!;
  }

  String getHealthRiskDescription() {
    String desc = "";
    switch(bmiCategory!) {
      case underweightSevere :
      case underweightModerate :
      case underweightMild :
        desc = "Kemungkinan kekurangan nutrisi dan osteoporosis.";
        break;
      case normal :
        desc = "Resiko rendah (kisaran sehat).";
        break;
      case overweight :
        desc = "Risiko sedang terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes melitus.";
        break;
      case obese1 :
      case obese2 :
      case obese3 :
        desc = "Risiko tinggi terkena penyakit jantung, tekanan darah tinggi, diabetes melitus, dan sindrom metabolisme.";
        break;
      default :
    }
    bmiDescription = desc;
    return desc;
  }

}