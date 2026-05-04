import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting1Page extends StatelessWidget {
  const Meeting1Page({super.key});

  Widget previewBox(Widget child, String label) {
    return PremiumCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.muted,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Center(child: child),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const code1 = """
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    ),
  );
}
""";

    const code2 = """
ElevatedButton(
  onPressed: () {
    print('Button diklik');
  },
  child: Text('Mulai Belajar'),
)
""";

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: AppHeader(
                          title: "Pertemuan 1",
                          subtitle:
                              "Pengenalan Flutter, widget, dan struktur dasar aplikasi",
                          icon: Icons.flutter_dash_rounded,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Apa itu Flutter?",
                          icon: Icons.lightbulb_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Flutter adalah framework dari Google untuk membuat aplikasi mobile, web, dan desktop menggunakan satu basis kode. Flutter memakai bahasa Dart dan membangun tampilan aplikasi melalui konsep widget.",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.7,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Konsep Utama",
                          icon: Icons.account_tree_rounded,
                        ),
                        SizedBox(height: 14),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            Chip(label: Text("Widget")),
                            Chip(label: Text("MaterialApp")),
                            Chip(label: Text("Scaffold")),
                            Chip(label: Text("AppBar")),
                            Chip(label: Text("Body")),
                            Chip(label: Text("Hot Reload")),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh Kode Dasar",
                          icon: Icons.code_rounded,
                        ),
                        CodeBlock(code1),
                      ],
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: previewBox(
                          const Text(
                            "Hello World",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          "Preview 1: Text sederhana",
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: previewBox(
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow_rounded),
                            label: const Text("Mulai Belajar"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          "Preview 2: Button interaktif",
                        ),
                      ),
                    ],
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh Kode Button",
                          icon: Icons.smart_button_rounded,
                        ),
                        CodeBlock(code2),
                      ],
                    ),
                  ),

                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Latihan Mini",
                          icon: Icons.task_alt_rounded,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Coba ubah teks Hello World menjadi nama aplikasi kamu, lalu ubah warna button sesuai tema aplikasi.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: 0.15,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(99),
                          backgroundColor: AppColors.border,
                          color: AppColors.accent,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Progress belajar materi ini: 15%",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 22),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const QuizPage(
                                  title: "Quiz Pertemuan 1",
                                  questions: [
                                    {
                                      "question": "Flutter dibuat oleh?",
                                      "options": [
                                        "Apple",
                                        "Google",
                                        "Microsoft",
                                        "Meta"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question": "Bahasa utama yang digunakan Flutter adalah?",
                                      "options": [
                                        "Java",
                                        "Dart",
                                        "Kotlin",
                                        "Swift"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question": "Semua tampilan UI di Flutter dibangun menggunakan konsep?",
                                      "options": [
                                        "Class",
                                        "Function",
                                        "Widget",
                                        "Module"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question": "Widget utama yang biasanya menjadi kerangka halaman adalah?",
                                      "options": [
                                        "Text",
                                        "Scaffold",
                                        "Image",
                                        "Icon"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question": "Fitur Flutter untuk melihat perubahan kode dengan cepat adalah?",
                                      "options": [
                                        "Hot Reload",
                                        "Cold Start",
                                        "Quick Build",
                                        "Auto Compile"
                                      ],
                                      "answer": 0,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz_rounded),
                          label: const Text("Mulai Quiz Pertemuan 1"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}