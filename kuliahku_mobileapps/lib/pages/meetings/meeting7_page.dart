import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting7Page extends StatelessWidget {
  const Meeting7Page({super.key});

  Widget profilePreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 62,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Nama Lengkap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "Mahasiswa Sistem Informasi",
            style: TextStyle(color: Colors.white.withOpacity(0.82)),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              Chip(
                backgroundColor: Colors.white.withOpacity(0.92),
                label: const Text("Flutter"),
              ),
              Chip(
                backgroundColor: Colors.white.withOpacity(0.92),
                label: const Text("PHP"),
              ),
              Chip(
                backgroundColor: Colors.white.withOpacity(0.92),
                label: const Text("MySQL"),
              ),
              Chip(
                backgroundColor: Colors.white.withOpacity(0.92),
                label: const Text("UI Design"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget identityTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const code1 = """
CircleAvatar(
  radius: 60,
  backgroundImage: AssetImage('assets/images/profile.jpg'),
)
""";

    const code2 = """
Column(
  children: [
    Text('Nama Lengkap'),
    Text('NIM: 2410xxxx'),
    Text('Kelas: SI-04'),
    Text('Prodi: Sistem Informasi'),
  ],
)
""";

    const code3 = """
Wrap(
  spacing: 8,
  children: [
    Chip(label: Text('Flutter')),
    Chip(label: Text('PHP')),
    Chip(label: Text('MySQL')),
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: AppHeader(
                          title: "Pertemuan 7",
                          subtitle: "Membuat halaman profile mahasiswa",
                          icon: Icons.account_circle_rounded,
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
                          title: "Konsep Profile Page",
                          icon: Icons.person_pin_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Profile page digunakan untuk menampilkan identitas pengguna aplikasi. Dalam project UTS ini, halaman profile berisi foto, nama, NIM, kelas, program studi, skill, dan hobi.",
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
                          title: "Menampilkan Foto Asset",
                          icon: Icons.image_rounded,
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
                          title: "Preview Profile Card",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),
                        profilePreview(),
                      ],
                    ),
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Menampilkan Identitas",
                          icon: Icons.badge_rounded,
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
                          title: "Preview Detail Identitas",
                          icon: Icons.assignment_ind_rounded,
                        ),
                        const SizedBox(height: 16),
                        identityTile(Icons.badge_rounded, "NIM", "2410xxxx"),
                        identityTile(Icons.class_rounded, "Kelas", "SI-04"),
                        identityTile(
                          Icons.school_rounded,
                          "Program Studi",
                          "Sistem Informasi",
                        ),
                        identityTile(
                          Icons.psychology_rounded,
                          "Skill",
                          "Flutter, PHP, MySQL, UI Design",
                        ),
                        identityTile(
                          Icons.sports_esports_rounded,
                          "Hobi",
                          "Coding, Belajar Teknologi, Olahraga",
                        ),
                      ],
                    ),
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Menampilkan Skill dengan Chip",
                          icon: Icons.psychology_rounded,
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
                          title: "Latihan Mini",
                          icon: Icons.task_alt_rounded,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Buat halaman profile yang memuat foto asset lokal, nama, NIM, kelas, program studi, skill, dan hobi. Gunakan kombinasi CircleAvatar, Text, Column, Row, dan Chip.",
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
                                  title: "Quiz Pertemuan 7",
                                  questions: [
                                    {
                                      "question":
                                          "Widget yang cocok untuk menampilkan foto profil berbentuk lingkaran adalah?",
                                      "options": [
                                        "Text",
                                        "CircleAvatar",
                                        "Row",
                                        "ListView"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Untuk mengambil gambar dari folder assets digunakan?",
                                      "options": [
                                        "NetworkImage",
                                        "FileImage",
                                        "AssetImage",
                                        "MemoryImage"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "Widget Chip biasanya digunakan untuk menampilkan?",
                                      "options": [
                                        "Database",
                                        "Label atau tag singkat",
                                        "Halaman baru",
                                        "Form input"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Widget yang menyusun data secara vertikal adalah?",
                                      "options": [
                                        "Column",
                                        "Row",
                                        "Stack",
                                        "Icon"
                                      ],
                                      "answer": 0,
                                    },
                                    {
                                      "question":
                                          "Data yang wajib ada di profile project UTS ini adalah?",
                                      "options": [
                                        "Foto, nama, NIM, kelas, prodi, skill, hobi",
                                        "Harga produk",
                                        "Data transaksi",
                                        "Data server"
                                      ],
                                      "answer": 0,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz_rounded),
                          label: const Text("Mulai Quiz Pertemuan 7"),
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