import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_header.dart';
import '../../widgets/premium_card.dart';

import 'meeting1_page.dart';
import 'meeting2_page.dart';
import 'meeting3_page.dart';
import 'meeting4_page.dart';
import 'meeting5_page.dart';
import 'meeting6_page.dart';
import 'meeting7_page.dart';

class MeetingListPage extends StatefulWidget {
  const MeetingListPage({super.key});

  @override
  State<MeetingListPage> createState() => _MeetingListPageState();
}

class _MeetingListPageState extends State<MeetingListPage> {
  final TextEditingController searchController = TextEditingController();
  String keyword = "";

  late List<Map<String, dynamic>> meetings;

  @override
  void initState() {
    super.initState();
    meetings = _defaultMeetings();
    loadSavedData();
  }

  List<Map<String, dynamic>> _defaultMeetings() {
    return [
      {
        "title": "Pertemuan 1",
        "topic": "Pengenalan Flutter",
        "desc": "Memahami Flutter, widget, dan struktur dasar aplikasi.",
        "icon": Icons.flutter_dash_rounded,
        "level": "Basic",
        "isDone": false,
        "isBookmarked": true,
      },
      {
        "title": "Pertemuan 2",
        "topic": "Widget & Button",
        "desc": "Membuat tampilan menggunakan widget dan button interaktif.",
        "icon": Icons.widgets_rounded,
        "level": "Basic",
        "isDone": false,
        "isBookmarked": false,
      },
      {
        "title": "Pertemuan 3",
        "topic": "Layout",
        "desc": "Menyusun UI menggunakan Row, Column, Container, dan Card.",
        "icon": Icons.dashboard_customize_rounded,
        "level": "Basic",
        "isDone": false,
        "isBookmarked": false,
      },
      {
        "title": "Pertemuan 4",
        "topic": "Input Form",
        "desc": "Membuat form input, validasi sederhana, dan controller.",
        "icon": Icons.edit_note_rounded,
        "level": "Medium",
        "isDone": false,
        "isBookmarked": false,
      },
      {
        "title": "Pertemuan 5",
        "topic": "ListView",
        "desc": "Menampilkan data dinamis dengan ListView dan ListTile.",
        "icon": Icons.list_alt_rounded,
        "level": "Medium",
        "isDone": false,
        "isBookmarked": false,
      },
      {
        "title": "Pertemuan 6",
        "topic": "Navigation",
        "desc": "Navigasi halaman dan bottom navigation modern.",
        "icon": Icons.navigation_rounded,
        "level": "Medium",
        "isDone": false,
        "isBookmarked": false,
      },
      {
        "title": "Pertemuan 7",
        "topic": "Profile Page",
        "desc": "Membuat halaman profil mahasiswa yang informatif.",
        "icon": Icons.account_circle_rounded,
        "level": "Project",
        "isDone": false,
        "isBookmarked": false,
      },
    ];
  }

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      for (int i = 0; i < meetings.length; i++) {
        meetings[i]["isDone"] = prefs.getBool("done_$i") ?? meetings[i]["isDone"];
        meetings[i]["isBookmarked"] =
            prefs.getBool("bookmark_$i") ?? meetings[i]["isBookmarked"];
      }
    });
  }

  Future<void> saveMeetingState(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("done_$index", meetings[index]["isDone"]);
    await prefs.setBool("bookmark_$index", meetings[index]["isBookmarked"]);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get filteredMeetings {
    if (keyword.isEmpty) return meetings;

    return meetings.where((item) {
      final key = keyword.toLowerCase();
      return item["title"].toString().toLowerCase().contains(key) ||
          item["topic"].toString().toLowerCase().contains(key) ||
          item["desc"].toString().toLowerCase().contains(key);
    }).toList();
  }

  double get totalProgress {
    final done = meetings.where((item) => item["isDone"] == true).length;
    return done / meetings.length;
  }

  int get doneCount =>
      meetings.where((item) => item["isDone"] == true).length;

  void openPage(BuildContext context, int index) {
    final pages = [
      const Meeting1Page(),
      const Meeting2Page(),
      const Meeting3Page(),
      const Meeting4Page(),
      const Meeting5Page(),
      const Meeting6Page(),
      const Meeting7Page(),
    ];

    final selectedTitle = filteredMeetings[index]["title"];
    final originalIndex =
        meetings.indexWhere((item) => item["title"] == selectedTitle);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => pages[originalIndex]),
    );
  }

  void toggleDone(String title) {
    final index = meetings.indexWhere((item) => item["title"] == title);

    setState(() {
      meetings[index]["isDone"] = !meetings[index]["isDone"];
    });

    saveMeetingState(index);
  }

  void toggleBookmark(String title) {
    final index = meetings.indexWhere((item) => item["title"] == title);

    setState(() {
      meetings[index]["isBookmarked"] = !meetings[index]["isBookmarked"];
    });

    saveMeetingState(index);
  }

  Color levelColor(String level) {
    if (level == "Project") return AppColors.orange;
    if (level == "Medium") return AppColors.accent;
    return AppColors.primary;
  }

  Widget progressSummary() {
    final percent = (totalProgress * 100).round();

    return PremiumCard(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 86,
                height: 86,
                child: CircularProgressIndicator(
                  value: totalProgress,
                  strokeWidth: 10,
                  backgroundColor: AppColors.border,
                  color: AppColors.accent,
                ),
              ),
              Text(
                "$percent%",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Progress Belajar Keseluruhan",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 6),
                Text(
                  "$doneCount dari ${meetings.length} materi sudah ditandai selesai. Data progress tersimpan otomatis di browser.",
                  style: const TextStyle(color: AppColors.muted, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return PremiumCard(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: searchController,
        onChanged: (value) => setState(() => keyword = value),
        decoration: InputDecoration(
          hintText: "Cari materi, contoh: Flutter, ListView, Navigation...",
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: keyword.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() => keyword = "");
                  },
                  icon: const Icon(Icons.close_rounded),
                )
              : null,
          filled: true,
          fillColor: AppColors.bg,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget bookmarkSummary() {
    final bookmarked =
        meetings.where((item) => item["isBookmarked"] == true).toList();

    if (bookmarked.isEmpty) return const SizedBox.shrink();

    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Bookmark Materi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: bookmarked.map((item) {
              return Chip(
                avatar: const Icon(Icons.bookmark_rounded,
                    size: 18, color: AppColors.orange),
                label: Text(item["topic"]),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget emptyState() {
    return const PremiumCard(
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 70, color: AppColors.muted),
          SizedBox(height: 12),
          Text("Materi tidak ditemukan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          SizedBox(height: 6),
          Text(
            "Coba gunakan kata kunci lain seperti Flutter, Layout, Form, atau ListView.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.muted),
          ),
        ],
      ),
    );
  }

  Widget meetingCard(Map<String, dynamic> item, int index) {
    final color = levelColor(item["level"]);
    final isDone = item["isDone"] as bool;
    final isBookmarked = item["isBookmarked"] as bool;

    return InkWell(
      onTap: () => openPage(context, index),
      borderRadius: BorderRadius.circular(24),
      child: PremiumCard(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(item["icon"], color: color, size: 34),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(item["title"],
                          style: const TextStyle(
                              color: AppColors.muted,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      if (isDone)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: const Text(
                            "Selesai",
                            style: TextStyle(
                              color: AppColors.accent,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item["topic"],
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(item["desc"],
                      style: const TextStyle(
                          color: AppColors.muted, height: 1.4)),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: isDone ? 1 : 0,
                          minHeight: 9,
                          borderRadius: BorderRadius.circular(99),
                          backgroundColor: AppColors.border,
                          color: isDone ? AppColors.accent : AppColors.orange,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        isDone ? "100%" : "0%",
                        style: TextStyle(
                          color: isDone ? AppColors.accent : AppColors.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Column(
              children: [
                IconButton(
                  tooltip: "Bookmark",
                  onPressed: () => toggleBookmark(item["title"]),
                  icon: Icon(
                    isBookmarked
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: isBookmarked ? AppColors.orange : AppColors.muted,
                  ),
                ),
                const SizedBox(height: 4),
                OutlinedButton.icon(
                  onPressed: () => toggleDone(item["title"]),
                  icon: Icon(
                    isDone
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked_rounded,
                    size: 18,
                  ),
                  label: Text(isDone ? "Batal" : "Selesai"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                        isDone ? AppColors.accent : AppColors.primary,
                    side: BorderSide(
                        color: isDone ? AppColors.accent : AppColors.primary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(item["level"],
                      style: TextStyle(
                          color: color, fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget resetButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.clear();

          setState(() {
            meetings = _defaultMeetings();
          });
        },
        icon: const Icon(Icons.refresh_rounded),
        label: const Text("Reset Progress"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = filteredMeetings;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AppHeader(
                  title: "Materi Kuliah",
                  subtitle:
                      "Cari materi, bookmark topik penting, dan simpan progress belajar otomatis",
                  icon: Icons.menu_book_rounded,
                ),
                const SizedBox(height: 24),
                progressSummary(),
                bookmarkSummary(),
                searchBox(),
                resetButton(),
                if (data.isEmpty)
                  emptyState()
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return meetingCard(data[index], index);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}