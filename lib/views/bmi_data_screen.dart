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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff12153B),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: BmiCard(
                      child: GenderIconText(
                        icon: Icons.male,
                        title: "Male",
                      ),
                    ),
                  ),

              Expanded(
                child: BmiCard(
                  child: GenderIconText(
                      title: 'Female', icon: Icons.female
                  ),
                )
              ),
            ],)),
          Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",
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
              child: Container(
              child: Row(
              children: [
                Expanded(child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,),
                        const SizedBox(height: 10,),
                        Text("60",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(onPressed: () {},
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: secondaryColorForBtnInCard,
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              ),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(width: 15,),
                            RawMaterialButton(onPressed: () {},
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
                        "AGE",
                        style: labelTextStyle
                      ),
                      const SizedBox(height: 10),
                      Text("21",
                        style: numberTextStyle,
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(onPressed: () {},
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: secondaryColorForBtnInCard,
                            constraints: const BoxConstraints.tightFor(
                              width: 45,
                              height: 45,
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                          SizedBox(width: 15,),
                          RawMaterialButton(onPressed: () {},
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
              ),
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3D416D),
        borderRadius: BorderRadius.circular(15)
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
