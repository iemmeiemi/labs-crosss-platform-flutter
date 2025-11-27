import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IAmRich extends StatelessWidget {
  const IAmRich({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("I Am Rich")),
      body: const Center(
        child: Image(
          image: AssetImage("assets/imgs/IamRich.jpg"),
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
