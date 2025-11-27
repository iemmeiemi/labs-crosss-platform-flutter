// --- RESULTS PAGE ---
import 'package:client/Presentation/Screens/Widgets/Button.dart';
import 'package:client/Presentation/Screens/Widgets/ReusableCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage(
      {super.key,
        required this.bmiResult,
        required this.resultText,
        required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Result')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(resultText,
                      style: const TextStyle(
                          fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold)),
                  Text(bmiResult,
                      style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(interpretation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}