import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/code_block.dart';
import '../../widgets/premium_card.dart';
import '../../widgets/section_title.dart';
import '../quiz/quiz_page.dart';

class Meeting8Page extends StatefulWidget {
  const Meeting8Page({super.key});

  @override
  State<Meeting8Page> createState() => _Meeting8PageState();
}

class _Meeting8PageState extends State<Meeting8Page> {
  String selectedLevel = "Beginner";
  String selectedCity = "Bogor";

  final List<String> techOptions = [
    "Flutter",
    "Dart",
    "Java",
    "PHP",
    "Python",
    "Laravel",
    "MySQL",
    "Cisco Networking",
    "4G Core Network",
  ];

  final List<String> cityOptions = [
    "Bogor",
    "Sukabumi",
    "Bekasi",
    "Karawang",
    "Purwakarta",
    "Depok",
  ];

  final List<String> levelOptions = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];

  @override
  Widget build(BuildContext context) {
    const codeAutoComplete = """
Autocomplete<String>(
  optionsBuilder: (TextEditingValue value) {
    return data.where((item) =>
      item.toLowerCase().contains(value.text.toLowerCase())
    );
  },
  onSelected: (String value) {
    print('Dipilih: \$value');
  },
)
""";

    const codeDropdown = """
DropdownButton<String>(
  value: selectedValue,
  items: data.map((item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      selectedValue = value!;
    });
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
                          title: "Pertemuan 8",
                          subtitle: "AutoComplete dan Spinner / DropdownButton",
                          icon: Icons.manage_search_rounded,
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
                          title: "Tujuan Pembelajaran",
                          icon: Icons.flag_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Setelah mempelajari pertemuan ini, mahasiswa diharapkan mampu memahami penggunaan AutoComplete dan Spinner/DropdownButton pada Flutter serta penerapannya dalam aplikasi Android maupun Flutter Web.",
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
                          title: "Konsep AutoComplete",
                          icon: Icons.search_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "AutoComplete adalah widget Flutter yang menampilkan daftar saran secara otomatis ketika pengguna mengetik pada field input. Widget ini cocok digunakan untuk pencarian kota, produk, teknologi, atau data pilihan yang jumlahnya banyak.",
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
                          title: "Contoh Code AutoComplete",
                          icon: Icons.code_rounded,
                        ),
                        CodeBlock(codeAutoComplete),
                      ],
                    ),
                  ),

                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Demo AutoComplete",
                          icon: Icons.preview_rounded,
                        ),
                        const SizedBox(height: 16),
                        Autocomplete<String>(
                          optionsBuilder: (TextEditingValue value) {
                            if (value.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }

                            return techOptions.where((item) {
                              return item.toLowerCase().contains(
                                    value.text.toLowerCase(),
                                  );
                            });
                          },
                          onSelected: (String value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Teknologi dipilih: $value"),
                              ),
                            );
                          },
                          fieldViewBuilder: (
                            context,
                            controller,
                            focusNode,
                            onEditingComplete,
                          ) {
                            return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              decoration: InputDecoration(
                                labelText: "Cari teknologi",
                                hintText: "Contoh: Flutter, Dart, Java...",
                                prefixIcon: const Icon(Icons.search_rounded),
                                filled: true,
                                fillColor: AppColors.bg,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          title: "Konsep Spinner / DropdownButton",
                          icon: Icons.arrow_drop_down_circle_rounded,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Spinner atau DropdownButton adalah komponen UI yang memungkinkan pengguna memilih satu opsi dari daftar pilihan. Komponen ini cocok digunakan pada form, filter, kategori, level, atau pemilihan lokasi.",
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
                          title: "Contoh Code DropdownButton",
                          icon: Icons.code_rounded,
                        ),
                        CodeBlock(codeDropdown),
                      ],
                    ),
                  ),

                  PremiumCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: "Demo Spinner Premium",
                          icon: Icons.tune_rounded,
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.14),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pilih Level Flutter",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 12),
                              DropdownButtonFormField<String>(
                                value: selectedLevel,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon:
                                      const Icon(Icons.school_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                items: levelOptions.map((level) {
                                  return DropdownMenuItem(
                                    value: level,
                                    child: Text(level),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedLevel = value!;
                                  });
                                },
                              ),
                              const SizedBox(height: 14),
                              Text(
                                "Level yang dipilih: $selectedLevel",
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w900,
                                ),
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
                          title: "Studi Kasus Mini",
                          icon: Icons.location_city_rounded,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Contoh penerapan dropdown pada aplikasi operasional: memilih kota atau wilayah kerja untuk filter data.",
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 16),

                        DropdownButtonFormField<String>(
                          value: selectedCity,
                          decoration: InputDecoration(
                            labelText: "Pilih Kota Area",
                            prefixIcon: const Icon(Icons.location_on_rounded),
                            filled: true,
                            fillColor: AppColors.bg,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          items: cityOptions.map((city) {
                            return DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 16),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.accent.withOpacity(0.12),
                                AppColors.primary.withOpacity(0.08),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Area yang dipilih: $selectedCity",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: AppColors.text,
                            ),
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
                          "Buat form sederhana yang memiliki AutoComplete untuk mencari data dan DropdownButton untuk memilih kategori atau level.",
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
                                  title: "Quiz Pertemuan 8",
                                  questions: [
                                    {
                                      "question":
                                          "Fungsi utama AutoComplete adalah?",
                                      "options": [
                                        "Menampilkan gambar",
                                        "Memberikan saran saat pengguna mengetik",
                                        "Menyimpan database",
                                        "Menghapus halaman"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Properti AutoComplete untuk menentukan daftar saran adalah?",
                                      "options": [
                                        "optionsBuilder",
                                        "onChanged",
                                        "items",
                                        "value"
                                      ],
                                      "answer": 0,
                                    },
                                    {
                                      "question":
                                          "Spinner pada Flutter dapat dibuat menggunakan widget?",
                                      "options": [
                                        "Text",
                                        "DropdownButton",
                                        "CircleAvatar",
                                        "ListTile"
                                      ],
                                      "answer": 1,
                                    },
                                    {
                                      "question":
                                          "Properti DropdownButton yang menyimpan nilai terpilih adalah?",
                                      "options": [
                                        "hint",
                                        "icon",
                                        "value",
                                        "style"
                                      ],
                                      "answer": 2,
                                    },
                                    {
                                      "question":
                                          "AutoComplete paling cocok digunakan ketika?",
                                      "options": [
                                        "Pilihan data cukup banyak dan perlu dicari",
                                        "Hanya menampilkan satu teks",
                                        "Menampilkan foto profil",
                                        "Membuat halaman kosong"
                                      ],
                                      "answer": 0,
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.quiz_rounded),
                          label: const Text("Mulai Quiz Pertemuan 8"),
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