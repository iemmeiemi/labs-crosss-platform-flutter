import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Destini extends StatefulWidget {
  const Destini({super.key});

  @override
  State<Destini> createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {

  int storyIndex = 0;

  final List<Map<String, dynamic>> _storyData = [
    {
      'storyTitle': 'Bạn thức dậy trong rừng rậm, hai con đường trước mặt.',
      'choice1': 'Đi về bên trái',
      'choice2': 'Đi về bên phải',
      'nextStory1': 1,
      'nextStory2': 2,
    },
    {
      'storyTitle': 'Bạn gặp một con suối. Bạn muốn:',
      'choice1': 'Bơi qua suối',
      'choice2': 'Đi vòng quanh',
      'nextStory1': 3,
      'nextStory2': 4,
    },
    {
      'storyTitle': 'Bạn tìm thấy một ngôi nhà hoang. Bạn muốn:',
      'choice1': 'Vào trong nhà',
      'choice2': 'Bỏ đi',
      'nextStory1': 4,
      'nextStory2': 3,
    },
    {
      'storyTitle': 'Bạn bơi qua suối thành công và tìm thấy kho báu. Kết thúc!',
      'choice1': 'Bắt đầu lại',
      'choice2': null,
      'nextStory1': 0,
      'nextStory2': null,
    },
    {
      'storyTitle': 'Bạn lạc trong rừng và không tìm thấy đường ra. Kết thúc!',
      'choice1': 'Bắt đầu lại',
      'choice2': null,
      'nextStory1': 0,
      'nextStory2': null,
    },
  ];

  void nextStory(int choice) {
    setState(() {
      int? nextIndex = choice == 1
          ? _storyData[storyIndex]['nextStory1']
          : _storyData[storyIndex]['nextStory2'];

      if (nextIndex != null) {
        storyIndex = nextIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = _storyData[storyIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Destini")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Nội dung story
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  currentStory['storyTitle'],
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Choice 1
            if (currentStory['choice1'] != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () => nextStory(1),
                    child: Text(
                      currentStory['choice1'],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),

            // Choice 2 (ẩn nếu null)
            if (currentStory['choice2'] != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () => nextStory(2),
                    child: Text(
                      currentStory['choice2'],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
