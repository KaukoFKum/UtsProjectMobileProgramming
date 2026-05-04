import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting4Page extends StatefulWidget {
  const Meeting4Page({super.key});

  @override
  State<Meeting4Page> createState() => _Meeting4PageState();
}

class _Meeting4PageState extends State<Meeting4Page> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController materiController = TextEditingController();

  String hasil = "Belum ada data";

  @override
  void dispose() {
    namaController.dispose();
    materiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const code1 = """
TextField(
  decoration: InputDecoration(
    labelText: 'Nama',
    border: OutlineInputBorder(),
  ),
)
""";

    const code2 = """
final controller = TextEditingController();

TextField(
  controller: controller,
)

ElevatedButton(
  onPressed: () {
    print(controller.text);
  },
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
                          title: "Pertemuan 4",
                          subtitle: "Input Form, TextField, dan Controller",
                          icon: Icons.edit_note_rounded,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ========================
                  // PENJELASAN
                  // ========================
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Konsep Input Form",
                          icon: Icons.input_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Form digunakan untuk menerima input dari pengguna. Flutter menyediakan TextField yang bisa dikontrol menggunakan TextEditingController untuk membaca dan memproses input.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.7,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ========================
                  // CODE 1
                  // ========================
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Contoh TextField",
                          icon: Icons.code_rounded,
                        ),
                        CodeBlock(code1),
                      ],
                    ),
                  ),

                  // ========================
                  // FORM INTERAKTIF
                  // ========================
                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Preview Form Interaktif",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),

                        TextField(
                          controller: namaController,
                          decoration: InputDecoration(
                            labelText: "Nama",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        TextField(
                          controller: materiController,
                          decoration: InputDecoration(
                            labelText: "Materi Favorit",
                            prefixIcon: const Icon(Icons.menu_book),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              hasil =
                                  "Nama: ${namaController.text}\nMateri: ${materiController.text}";
                            });
                          },
                          icon: const Icon(Icons.save),
                          label: const Text("Simpan"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.bg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            hasil,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ========================
                  // CODE 2
                  // ========================
                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Controller & Button",
                          icon: Icons.code,
                        ),
                        CodeBlock(code2),
                      ],
                    ),
                  ),

                  // ========================
                  // LATIHAN + QUIZ
                  // ========================
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
                          "Buat form dengan minimal 2 input dan tampilkan hasilnya di bawah tombol.",
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
                                  title: "Quiz Pertemuan 4",
                                  questions: [
                                    {
                                      "question":
                                          "Widget untuk input teks di Flutter adalah?",
                                      "options": [
                                        "Text",
                                        "TextField",
                                        "Column",
                                        "Row"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Controller digunakan untuk?",
                                      "options": [
                                        "Mengatur warna",
                                        "Mengambil input",
                                        "Menampilkan gambar",
                                        "Navigasi"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Properti untuk label pada TextField?",
                                      "options": [
                                        "text",
                                        "labelText",
                                        "value",
                                        "hint"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Widget untuk tombol adalah?",
                                      "options": [
                                        "ElevatedButton",
                                        "TextField",
                                        "Image",
                                        "ListView"
                                      ],
                                      "answer": 0,
                                    },
                                    {
                                      "question":
                                          "Fungsi setState digunakan untuk?",
                                      "options": [
                                        "Menghapus data",
                                        "Mengupdate UI",
                                        "Menyimpan database",
                                        "Mengambil API"
                                      ],
                                      "answer": 1,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz),
                          label: const Text("Mulai Quiz Pertemuan 4"),
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