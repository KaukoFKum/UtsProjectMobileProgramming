import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/premium_card.dart';

class QuizPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> questions;

  const QuizPage({
    super.key,
    required this.title,
    required this.questions,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int score = 0;
  int? selectedIndex;
  bool showResult = false;

  void answer(int index) {
    if (selectedIndex != null) return;

    setState(() {
      selectedIndex = index;
      if (index == widget.questions[currentIndex]["answer"]) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
      });
    } else {
      setState(() {
        showResult = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      final percent =
          ((score / widget.questions.length) * 100).round();

      String message = "Perlu belajar lagi 📚";
      if (percent >= 80) message = "Excellent 🔥";
      else if (percent >= 60) message = "Good 👍";

      return Scaffold(
        body: Center(
          child: PremiumCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Score: $percent%",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(message),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Kembali"),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final question = widget.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: PremiumCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Soal ${currentIndex + 1}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                question["question"],
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              ...List.generate(
                question["options"].length,
                (index) {
                  final isCorrect =
                      index == question["answer"];
                  final isSelected = index == selectedIndex;

                  Color color = AppColors.border;

                  if (selectedIndex != null) {
                    if (isCorrect) {
                      color = Colors.green;
                    } else if (isSelected) {
                      color = Colors.red;
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => answer(index),
                      child: Text(question["options"][index]),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed:
                    selectedIndex == null ? null : nextQuestion,
                child: const Text("Next"),
              )
            ],
          ),
        ),
      ),
    );
  }
}