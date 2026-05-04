import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting5Page extends StatelessWidget {
  const Meeting5Page({super.key});

  final List<Map<String, dynamic>> materi = const [
    {
      "title": "Pengenalan Flutter",
      "desc": "Dasar framework Flutter dan struktur project.",
      "icon": Icons.flutter_dash_rounded,
      "color": AppColors.primary,
    },
    {
      "title": "Widget & Button",
      "desc": "Membuat komponen UI dan tombol interaktif.",
      "icon": Icons.widgets_rounded,
      "color": AppColors.secondary,
    },
    {
      "title": "Layout",
      "desc": "Menyusun tampilan menggunakan Row dan Column.",
      "icon": Icons.dashboard_customize_rounded,
      "color": AppColors.accent,
    },
    {
      "title": "Form Input",
      "desc": "Mengambil input dari user menggunakan TextField.",
      "icon": Icons.edit_note_rounded,
      "color": AppColors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    const code1 = """
ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(data[index]),
    );
  },
)
""";

    const code2 = """
Card(
  child: ListTile(
    leading: Icon(Icons.book),
    title: Text('Pertemuan 1'),
    subtitle: Text('Pengenalan Flutter'),
    trailing: Icon(Icons.arrow_forward),
  ),
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
                          title: "Pertemuan 5",
                          subtitle: "ListView dan menampilkan data dinamis",
                          icon: Icons.list_alt_rounded,
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
                          title: "Konsep ListView",
                          icon: Icons.list_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "ListView digunakan untuk menampilkan data dalam bentuk daftar yang dapat di-scroll. Cocok digunakan untuk menampilkan menu, produk, berita, atau daftar materi.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // CODE 1
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh ListView.builder",
                          icon: Icons.code_rounded,
                        ),
                        CodeBlock(code1),
                      ],
                    ),
                  ),

                  // PREVIEW LIST
                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Preview List Materi",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),

                        ...materi.map((item) {
                          final Color color = item["color"];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.bg,
                              borderRadius: BorderRadius.circular(18),
                              border:
                                  Border.all(color: AppColors.border),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.12),
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),
                                  child: Icon(item["icon"],
                                      color: color),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["title"],
                                        style: const TextStyle(
                                            fontWeight:
                                                FontWeight.w900),
                                      ),
                                      Text(
                                        item["desc"],
                                        style: const TextStyle(
                                            color: AppColors.muted),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                  color: AppColors.muted,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),

                  // CODE 2
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh Card + ListTile",
                          icon: Icons.view_list_rounded,
                        ),
                        CodeBlock(code2),
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
                          "Buat ListView sederhana yang menampilkan minimal 5 data berbeda (misalnya daftar buku, menu, atau produk).",
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
                                  title: "Quiz Pertemuan 5",
                                  questions: [
                                    {
                                      "question":
                                          "Widget untuk menampilkan list adalah?",
                                      "options": [
                                        "Row",
                                        "Column",
                                        "ListView",
                                        "Container"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "ListView.builder digunakan untuk?",
                                      "options": [
                                        "Static data",
                                        "Dynamic data",
                                        "Image",
                                        "API only"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Properti jumlah item pada ListView adalah?",
                                      "options": [
                                        "length",
                                        "itemCount",
                                        "total",
                                        "size"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Widget untuk menampilkan satu item list adalah?",
                                      "options": [
                                        "Card",
                                        "ListTile",
                                        "Text",
                                        "Column"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "ListView biasanya digunakan untuk?",
                                      "options": [
                                        "Login",
                                        "Menampilkan data banyak",
                                        "Animasi",
                                        "Database"
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
                              const Text("Mulai Quiz Pertemuan 5"),
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