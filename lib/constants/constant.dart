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
const String underweightSevere = "Terlalu Kurus";
const String underweightModerate = "Kurus";
const String underweightMild = "Tidak Terlalu Kurus";
const String normal = "Normal";
const String overweight = "Kelebihan Berat Badan";
const String obese1 = "Gemuk (Kelas 1)";
const String obese2 = "Gemuk (Kelas 2)";
const String obese3 = "Gemuk (Kelas 3)";