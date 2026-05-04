import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting3Page extends StatelessWidget {
  const Meeting3Page({super.key});

  Widget smallBox(String text, Color color) {
    return Container(
      width: 95,
      height: 75,
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const code1 = """
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Text('A'),
    Text('B'),
    Text('C'),
  ],
)
""";

    const code2 = """
Column(
  children: [
    Icon(Icons.school),
    Text('KuliahKu'),
    Text('Mobile Programming'),
  ],
)
""";

    const code3 = """
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Text('Card Materi'),
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
                          title: "Pertemuan 3",
                          subtitle:
                              "Layout menggunakan Row, Column, Container, dan Card",
                          icon: Icons.dashboard_customize_rounded,
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
                          title: "Konsep Layout",
                          icon: Icons.grid_view_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Layout digunakan untuk mengatur posisi dan susunan widget. Row menyusun widget secara horizontal, sedangkan Column menyusun widget secara vertikal. Container dan Card membantu membuat tampilan lebih rapi dan menarik.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.7,
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
                          title: "Contoh Row",
                          icon: Icons.view_column_rounded,
                        ),
                        CodeBlock(code1),
                      ],
                    ),
                  ),

                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Preview Row",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            smallBox("A", AppColors.primary),
                            smallBox("B", AppColors.secondary),
                            smallBox("C", AppColors.accent),
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
                          title: "Contoh Column",
                          icon: Icons.view_agenda_rounded,
                        ),
                        CodeBlock(code2),
                      ],
                    ),
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Preview Column",
                          icon: Icons.phone_android_rounded,
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.school_rounded,
                                color: AppColors.primary,
                                size: 54,
                              ),
                              SizedBox(height: 8),
                              Text(
                                "KuliahKu",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "Mobile Programming",
                                style: TextStyle(color: AppColors.muted),
                              ),
                            ],
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
                          title: "Contoh Container",
                          icon: Icons.crop_square_rounded,
                        ),
                        CodeBlock(code3),
                      ],
                    ),
                  ),

                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Preview Card Layout",
                          icon: Icons.credit_card_rounded,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.secondary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.auto_stories_rounded,
                                color: Colors.white,
                                size: 42,
                              ),
                              SizedBox(height: 14),
                              Text(
                                "Card Materi Premium",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Container dapat digunakan untuk membuat kartu informasi yang rapi.",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
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
                          "Buat halaman sederhana menggunakan kombinasi Row, Column, Container, dan Card. Contohnya kartu profil, kartu materi, atau dashboard kecil.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 22),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const QuizPage(
                                  title: "Quiz Pertemuan 3",
                                  questions: [
                                    {
                                      "question":
                                          "Widget yang digunakan untuk menyusun elemen secara horizontal adalah?",
                                      "options": [
                                        "Column",
                                        "Row",
                                        "Stack",
                                        "ListView"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Widget yang digunakan untuk menyusun elemen secara vertikal adalah?",
                                      "options": [
                                        "Column",
                                        "Row",
                                        "Container",
                                        "Icon"
                                      ],
                                      "answer": 0,
                                    },
                                    {
                                      "question":
                                          "Properti yang sering digunakan untuk mengatur jarak antar elemen dalam Row adalah?",
                                      "options": [
                                        "mainAxisAlignment",
                                        "fontSize",
                                        "backgroundColor",
                                        "image"
                                      ],
                                      "answer": 0,
                                    },
                                    {
                                      "question":
                                          "Widget yang sering digunakan untuk memberi padding, warna, ukuran, dan border radius adalah?",
                                      "options": [
                                        "Text",
                                        "Container",
                                        "Icon",
                                        "Navigator"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Card cocok digunakan untuk membuat tampilan seperti?",
                                      "options": [
                                        "Database",
                                        "Kartu informasi",
                                        "Compiler",
                                        "Terminal"
                                      ],
                                      "answer": 1,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz_rounded),
                          label: const Text("Mulai Quiz Pertemuan 3"),
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