import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DicePageState();
}

class _DicePageState extends State<Dice> {
  final Random _random = Random();
  int _dice1 = 1;
  int _dice2 = 1;

  void rollDice() {
    setState(() {
      _dice1 = _random.nextInt(6) + 1;
      _dice2 = _random.nextInt(6) + 1;
    });
  }

  static const List<List<List<bool>>> diceDots = [
    // 1
    [
      [false, false, false],
      [false, true, false],
      [false, false, false],
    ],
    // 2
    [
      [true, false, false],
      [false, false, false],
      [false, false, true],
    ],
    // 3
    [
      [true, false, false],
      [false, true, false],
      [false, false, true],
    ],
    // 4
    [
      [true, false, true],
      [false, false, false],
      [true, false, true],
    ],
    // 5
    [
      [true, false, true],
      [false, true, false],
      [true, false, true],
    ],
    // 6
    [
      [true, false, true],
      [true, false, true],
      [true, false, true],
    ],
  ];

  // Widget hiển thị 1 dice
  Widget diceFace(int value) => Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: diceDots[value - 1].map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row.map((hasDot) {
            return hasDot
                ? Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            )
                : const SizedBox(width: 12, height: 12);
          }).toList(),
        );
      }).toList(),
    ),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Dice")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              diceFace(_dice1),
              const SizedBox(width: 20),
              diceFace(_dice2),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: rollDice,
            child: const Text("Roll Dice"),
          ),
        ],
      )
    );

  }
}