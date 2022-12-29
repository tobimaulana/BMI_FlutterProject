import 'package:flutter/material.dart';

const Color primaryBGColor = Color(0xff12153B);
Color primaryBGColorAccent = const Color(0xff1E285D);
Color secondaryColorForBtnInCard= const Color(0xff7175A9);
TextStyle genderTextStyle = const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            );
TextStyle labelTextStyle = const TextStyle(
  fontSize: 17,
  color: Colors.white,
);

TextStyle numberTextStyle = const TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w900,
    color: Colors.white
);

// Buat variabel konstan u/ pengkategorian hasil BMI agar tidak typo komparasi
const String underweightSevere = "Underweight (Severe Thinness)";
const String underweightModerate = "Underweight (Moderate Thinness)";
const String underweightMild = "Underweight (Mild Thinness)";
const String normal = "Normal";
const String overweight = "Overweight";
const String obese1 = "Obese (Class 1)";
const String obese2 = "Obese (Class 2)";
const String obese3 = "Obese (Class 3)";