import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const sentences = [ "8 \nPress me", "No", "Yes", "You may rely on it", "It is decidedly so", "My Sources say no", "Don't count on it", "Most likely", "Outlook good" ];

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  final Random _random = Random();
  int index = 0;

  void randomize() {
    setState(() {
      index = _random.nextInt(8) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    const spacing = 5.0;
    return Scaffold(
      appBar: AppBar(title: const Text("Magic 8 Ball")),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: spacing ,
        children: [
          Container(
            height: 400,
            width: 400,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.black, width: 100.0),
            ),
            child: Text(sentences[index], textAlign: TextAlign.center, selectionColor: Colors.blueAccent,
                style: GoogleFonts.merriweather(
                  fontSize: 20
            )),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: randomize,
            child: const Text("Press"),
          ),
        ],
      )
    );
  }
}
