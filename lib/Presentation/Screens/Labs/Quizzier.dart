import 'package:flutter/material.dart';



class Quizzier extends StatefulWidget {
  const Quizzier({super.key});

  @override
  State<Quizzier> createState() => _QuizPageState();
}

class _QuizPageState extends State<Quizzier> {
  int questionIndex = 0;

  // 0 = chưa trả lời, 1 = đúng, -1 = sai
  List<int> questionStatus = List.filled(15, 0);

  final List<Map<String, dynamic>> questions = List.generate(
    15,
        (index) => {
      'text': 'Câu hỏi số ${index + 1}',
      'answer': index % 2 == 0, // ví dụ: câu chẵn = đúng, câu lẻ = sai
    },
  );

  void checkAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = questions[questionIndex]['answer'];
      questionStatus[questionIndex] = (userAnswer == correctAnswer) ? 1 : -1;

      questionIndex++;

      // Reset khi hết câu hỏi
      if (questionIndex >= questions.length) {
        questionIndex = 0;
        questionStatus = List.filled(questions.length, 0);
      }
    });
  }

  Widget buildAnswerButton({required String text, required bool answer, required Color color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed: () => checkAnswer(answer),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildQuestionMenu() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          Color bgColor;
          if (index == questionIndex) {
            bgColor = Colors.amber; // câu hỏi hiện tại
          } else if (questionStatus[index] == 1) {
            bgColor = Colors.green; // trả lời đúng
          } else if (questionStatus[index] == -1) {
            bgColor = Colors.red; // trả lời sai
          } else {
            bgColor = Colors.grey.shade300; // chưa trả lời
          }

          return Container(
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quizzier")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Menu các câu hỏi
          buildQuestionMenu(),

          // Câu hỏi
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                questions[questionIndex]['text'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28),
              ),
            ),
          ),

          // Nút trả lời
          buildAnswerButton(text: 'Đúng', answer: true, color: Colors.green),
          buildAnswerButton(text: 'Sai', answer: false, color: Colors.red),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
