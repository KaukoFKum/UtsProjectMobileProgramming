import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting2Page extends StatelessWidget {
  const Meeting2Page({super.key});

  Widget previewButton(String label, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const code1 = """
Text(
  'Belajar Widget Flutter',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
""";

    const code2 = """
ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.play_arrow),
  label: Text('Mulai'),
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
                          title: "Pertemuan 2",
                          subtitle: "Widget dan Button pada Flutter",
                          icon: Icons.widgets_rounded,
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
                          title: "Konsep Widget",
                          icon: Icons.extension_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Widget adalah komponen utama dalam Flutter. Hampir semua elemen tampilan seperti teks, tombol, gambar, layout, dan halaman dibangun menggunakan widget.",
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
                          title: "Contoh Text Widget",
                          icon: Icons.text_fields_rounded,
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
                          title: "Preview Text",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: AppColors.bg,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Center(
                            child: Text(
                              "Belajar Widget Flutter",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: AppColors.primary,
                              ),
                            ),
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
                          title: "Contoh Button",
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
                          title: "Variasi Button",
                          icon: Icons.touch_app_rounded,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 14,
                          runSpacing: 14,
                          children: [
                            previewButton(
                              "Mulai",
                              Icons.play_arrow_rounded,
                              AppColors.primary,
                            ),
                            previewButton(
                              "Simpan",
                              Icons.save_rounded,
                              AppColors.accent,
                            ),
                            previewButton(
                              "Favorit",
                              Icons.favorite_rounded,
                              AppColors.orange,
                            ),
                          ],
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
                          "Buat minimal 3 jenis button berbeda, lalu ubah warna, icon, dan teksnya sesuai fungsi aplikasi.",
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
                                  title: "Quiz Pertemuan 2",
                                  questions: [
                                    {
                                      "question":
                                          "Komponen utama untuk membangun UI di Flutter disebut?",
                                      "options": [
                                        "Widget",
                                        "Database",
                                        "Package",
                                        "Server"
                                      ],
                                      "answer": 0,
                                    },
                                    {
                                      "question":
                                          "Widget untuk menampilkan teks adalah?",
                                      "options": [
                                        "Image",
                                        "Text",
                                        "Button",
                                        "Container"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Widget tombol yang memiliki tampilan menonjol adalah?",
                                      "options": [
                                        "TextField",
                                        "Column",
                                        "ElevatedButton",
                                        "ListView"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "Properti untuk mengatur aksi saat button diklik adalah?",
                                      "options": [
                                        "child",
                                        "style",
                                        "onPressed",
                                        "color"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "Widget untuk menampilkan icon pada button dapat dibuat dengan?",
                                      "options": [
                                        "ElevatedButton.icon",
                                        "Text.icon",
                                        "Container.icon",
                                        "Scaffold.icon"
                                      ],
                                      "answer": 0,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz_rounded),
                          label: const Text("Mulai Quiz Pertemuan 2"),
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