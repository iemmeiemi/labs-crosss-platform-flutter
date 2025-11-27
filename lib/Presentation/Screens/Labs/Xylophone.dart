import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final AudioPlayer player = AudioPlayer();

  void playSound(int no) async {
    await player.stop(); // dừng âm thanh cũ nếu có
    await player.play(AssetSource('sounds/note$no.wav')); // bỏ 'assets/'
  }

  Widget buildKey({required int no, required Color color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: () => playSound(no),
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xylophone")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(no: 1, color: Colors.red),
          buildKey(no: 2, color: Colors.orange),
          buildKey(no: 3, color: Colors.yellow),
          buildKey(no: 4, color: Colors.green),
          buildKey(no: 5, color: Colors.teal),
          buildKey(no: 6, color: Colors.blue),
          buildKey(no: 7, color: Colors.purple),
        ],
      ),
    );
  }
}
