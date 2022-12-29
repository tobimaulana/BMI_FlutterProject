import 'package:body_mass_index/helpers/bmi_calculator.dart';
import 'package:body_mass_index/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {

  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBmi() {
  //     // Rumus BMI -> BMI = berat (dalam kg) / tinggi (dalam m) dikuadratkan
  //     double heightInMeter = height / 100;
  //     final h = (heightInMeter * heightInMeter);
  //     final bmi = weight / h;
  //     return bmi;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff12153B),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kalkulator Indeks Massa Tubuh"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        gender = "male";
                        setState(() {});
                      },
                      child: BmiCard(
                        borderColor: (gender == "male") ? Colors.white : primaryBGColor,
                        child: const GenderIconText(
                          icon: Icons.male,
                          title: "Laki-Laki",
                        ),
                      ),
                    ),
                  ),

               Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor: (gender == "female") ? Colors.white : primaryBGColor,
                    child: const GenderIconText(
                        title: 'Perempuan', icon: Icons.female
                    ),
                  ),
                )
              ),
            ],)),
          Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TINGGI BADAN",
                    style: labelTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberTextStyle,
                        ),
                        const Text("cm",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 200,
                      thumbColor: Colors.amber,
                      activeColor: Colors.grey,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {

                        });
                      },
                    )
                  ],
                ),
              )),
          Expanded(
              child: Row(
              children: [
                Expanded(child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BERAT BADAN",
                          style: labelTextStyle,),
                        const SizedBox(height: 10,),
                        Text("$weight",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(onPressed: () {
                              weight += 1;
                              setState(() {

                              });
                            },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: secondaryColorForBtnInCard,
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            const SizedBox(width: 15),
                            RawMaterialButton(onPressed: () {
                              weight -= 1;
                              setState(() {

                              });
                            },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: secondaryColorForBtnInCard,
                              constraints:
                              const BoxConstraints
                                  .tightFor(
                                    width: 45,
                                    height: 45,
                                  ),
                              child: const Icon(Icons.remove, color: Colors.white,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "UMUR",
                        style: labelTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text("$age",
                        style: numberTextStyle,
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(onPressed: () {
                            age++;
                            setState(() {

                            });
                          },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: secondaryColorForBtnInCard,
                            constraints: const BoxConstraints.tightFor(
                              width: 45,
                              height: 45,
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                          const SizedBox(width: 15),
                          RawMaterialButton(onPressed: () {
                            age--;
                            setState(() {

                            });
                          },
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: secondaryColorForBtnInCard,
                            constraints:
                              const BoxConstraints
                                .tightFor(
                                  width: 45,
                                  height: 45,
                                ),
                            child: const Icon(Icons.remove, color: Colors.white,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ),
              ],
              )),
          GestureDetector(
            onTap: (){
              final bmiCalculator = BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: ((context) {
                  return BmiResultScreen(
                    // calculateBmi : mengembalikan sebuah nilai double
                    bmi: bmiCalculator.bmi!,
                  );
                }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: Colors.amber,
              child: const Center(child: Text("Hitung BMI",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child, this.borderColor = primaryBGColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3D416D),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!
        ),
      ),
      margin: const EdgeInsets.all(20),
      child: child
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, required this.title, required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
      Icon(icon,
          size: 70,color: Colors.white,
      ),
      const SizedBox(height: 15,),
      Text(title,
          style: genderTextStyle,
      ),
      ],
    );
  }
}
