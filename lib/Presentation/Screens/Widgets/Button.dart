import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2,
      shape: const CircleBorder(),
      fillColor: Colors.grey.shade300,
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      child: Icon(icon),
    );
  }
}

// --- BOTTOM BUTTON ---
class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const BottomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.purple,
        margin: const EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            )),
      ),
    );
  }
}