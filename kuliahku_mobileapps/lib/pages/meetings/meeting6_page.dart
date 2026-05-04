import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting6Page extends StatelessWidget {
  const Meeting6Page({super.key});

  @override
  Widget build(BuildContext context) {
    const code1 = """
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => HalamanBaru(),
  ),
);
""";

    const code2 = """
SalomonBottomBar(
  currentIndex: index,
  onTap: (i) => setState(() => index = i),
  items: [
    SalomonBottomBarItem(
      icon: Icon(Icons.home),
      title: Text("Home"),
      selectedColor: Colors.blue,
    ),
  ],
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
                  // HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: AppHeader(
                          title: "Pertemuan 6",
                          subtitle: "Navigation dan Bottom Navigation Bar",
                          icon: Icons.navigation_rounded,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // PENJELASAN
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Konsep Navigation",
                          icon: Icons.route_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Navigation digunakan untuk berpindah antar halaman dalam aplikasi. Flutter menggunakan Navigator.push untuk membuka halaman baru dan Navigator.pop untuk kembali.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CODE NAVIGATION
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh Navigator.push",
                          icon: Icons.code_rounded,
                        ),
                        CodeBlock(code1),
                      ],
                    ),
                  ),

                  // DEMO BUTTON NAVIGATION
                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Preview Navigation",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DemoPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.open_in_new),
                          label: const Text("Buka Halaman Demo"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CODE BOTTOM BAR
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh Bottom Navigation",
                          icon: Icons.code,
                        ),
                        CodeBlock(code2),
                      ],
                    ),
                  ),

                  // PREVIEW BOTTOM BAR
                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Preview Bottom Bar",
                          icon: Icons.smartphone,
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.bg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SalomonBottomBar(
                            currentIndex: 1,
                            items: [
                              SalomonBottomBarItem(
                                icon: const Icon(Icons.home),
                                title: const Text("Home"),
                                selectedColor: AppColors.primary,
                              ),
                              SalomonBottomBarItem(
                                icon: const Icon(Icons.menu_book),
                                title: const Text("Materi"),
                                selectedColor: AppColors.accent,
                              ),
                              SalomonBottomBarItem(
                                icon: const Icon(Icons.person),
                                title: const Text("Profile"),
                                selectedColor: AppColors.orange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // LATIHAN + QUIZ
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
                          "Buat minimal 2 halaman dan gunakan Navigator untuk berpindah antar halaman tersebut.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 22),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const QuizPage(
                                  title: "Quiz Pertemuan 6",
                                  questions: [
                                    {
                                      "question":
                                          "Fungsi Navigator.push adalah?",
                                      "options": [
                                        "Kembali ke halaman sebelumnya",
                                        "Membuka halaman baru",
                                        "Menghapus halaman",
                                        "Menyimpan data"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Fungsi Navigator.pop adalah?",
                                      "options": [
                                        "Membuka halaman",
                                        "Keluar aplikasi",
                                        "Kembali ke halaman sebelumnya",
                                        "Refresh UI"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "Bottom Navigation digunakan untuk?",
                                      "options": [
                                        "Input data",
                                        "Navigasi antar menu utama",
                                        "Database",
                                        "API"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Package yang digunakan pada project ini untuk bottom bar?",
                                      "options": [
                                        "Material",
                                        "Cupertino",
                                        "Salomon Bottom Bar",
                                        "Navigator"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "Widget untuk membuat halaman baru adalah?",
                                      "options": [
                                        "Container",
                                        "Scaffold",
                                        "Row",
                                        "Text"
                                      ],
                                      "answer": 1,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz),
                          label:
                              const Text("Mulai Quiz Pertemuan 6"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
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

// =======================
// DEMO HALAMAN BARU
// =======================
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Demo")),
      body: Center(
        child: PremiumCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                size: 70,
                color: AppColors.accent,
              ),
              const SizedBox(height: 12),
              const Text(
                "Navigasi Berhasil",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Halaman ini dibuka menggunakan Navigator.push.",
                style: TextStyle(color: AppColors.muted),
              ),
              const SizedBox(height: 18),
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
}