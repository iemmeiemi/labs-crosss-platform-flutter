import 'dart:math';

import 'package:client/Presentation/Screens/Labs/BMIResult.dart';
import 'package:client/Presentation/Screens/Widgets/Button.dart';
import 'package:client/Presentation/Screens/Widgets/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
enum Gender { male, female }

class BMICal extends StatefulWidget {
  const BMICal({super.key});

  @override
  State<BMICal> createState() => _BMICalState();
}

class _BMICalState extends State<BMICal> {
  Gender? selectedGender;
  double height = 170;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // GENDER SELECTION
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? Colors.purple
                        : Colors.grey.shade200,
                    child: GestureDetector(
                      onTap: () => setState(() => selectedGender = Gender.male),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.male, size: 80),
                          SizedBox(height: 10),
                          Text('MALE', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? Colors.purple
                        : Colors.grey.shade200,
                    child: GestureDetector(
                      onTap: () =>
                          setState(() => selectedGender = Gender.female),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.female, size: 80),
                          SizedBox(height: 10),
                          Text('FEMALE', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // HEIGHT SLIDER
          Expanded(
            child: ReusableCard(
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: TextStyle(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toInt().toString(),
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                      const Text(' cm', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 120,
                    max: 220,
                    onChanged: (value) => setState(() => height = value),
                  ),
                ],
              ),
            ),
          ),

          // WEIGHT & AGE
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: TextStyle(fontSize: 18)),
                        Text(weight.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () =>
                                  setState(() => weight = max(1, weight - 1)),
                            ),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () => setState(() => weight++),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: TextStyle(fontSize: 18)),
                        Text(age.toString(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () => setState(() => age = max(1, age - 1)),
                            ),
                            const SizedBox(width: 10),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () => setState(() => age++),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // CALCULATE BUTTON
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              String status;
              String advice;

              if (bmi < 18.5) {
                status = 'Underweight';
                advice = 'You should eat more nutritious food.';
              } else if (bmi < 25) {
                status = 'Normal';
                advice = 'Great job! Keep maintaining your health.';
              } else {
                status = 'Overweight';
                advice = 'Try to exercise more and eat healthy.';
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmi.toStringAsFixed(1),
                    resultText: status,
                    interpretation: advice,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}