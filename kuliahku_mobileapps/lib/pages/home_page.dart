import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_colors.dart';
import '../widgets/app_header.dart';
import '../widgets/premium_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int doneCount = 0;
  int bookmarkCount = 0;
  final int totalMeetings = 8;

  @override
  void initState() {
    super.initState();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    final prefs = await SharedPreferences.getInstance();

    int done = 0;
    int bookmark = 0;

    for (int i = 0; i < totalMeetings; i++) {
      if (prefs.getBool("done_$i") == true) done++;
      if (prefs.getBool("bookmark_$i") == true) bookmark++;
    }

    setState(() {
      doneCount = done;
      bookmarkCount = bookmark;
    });
  }

  double get progress => doneCount / totalMeetings;

  Widget statCard(IconData icon, String value, String label, Color color) {
    return PremiumCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(label, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
    );
  }

  Widget progressDashboard() {
    final percent = (progress * 100).round();

    return PremiumCard(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 11,
                  backgroundColor: AppColors.border,
                  color: AppColors.accent,
                ),
              ),
              Text(
                "$percent%",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dashboard Belajar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$doneCount dari $totalMeetings materi sudah selesai. $bookmarkCount materi masuk bookmark.",
                  style: const TextStyle(
                    color: AppColors.muted,
                    height: 1.5,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 14),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(99),
                  backgroundColor: AppColors.border,
                  color: AppColors.accent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget learningPath() {
    final steps = [
      {
        "title": "Basic",
        "desc": "Flutter, Widget, Layout",
        "icon": Icons.foundation_rounded,
        "color": AppColors.primary,
      },
      {
        "title": "Medium",
        "desc": "Form, ListView, Navigation, AutoComplete",
        "icon": Icons.layers_rounded,
        "color": AppColors.accent,
      },
      {
        "title": "Project",
        "desc": "Profile Page dan final app",
        "icon": Icons.rocket_launch_rounded,
        "color": AppColors.orange,
      },
    ];

    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Learning Path",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 16),
          Row(
            children: steps.map((item) {
              final Color color = item["color"] as Color;

              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: color.withOpacity(0.25)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(item["icon"] as IconData, color: color, size: 32),
                      const SizedBox(height: 12),
                      Text(
                        item["title"].toString(),
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item["desc"].toString(),
                        style: const TextStyle(
                          color: AppColors.muted,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget refreshInfo() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: loadDashboardData,
        icon: const Icon(Icons.refresh_rounded),
        label: const Text("Refresh Dashboard"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1150),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const AppHeader(
                  title: "KuliahKu",
                  subtitle:
                      "Dashboard pembelajaran Mobile Programming berbasis Flutter Web",
                  icon: Icons.school_rounded,
                ),
                const SizedBox(height: 24),

                progressDashboard(),
                refreshInfo(),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: statCard(
                        Icons.auto_stories_rounded,
                        "8",
                        "Materi Pertemuan",
                        AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: statCard(
                        Icons.task_alt_rounded,
                        "$doneCount",
                        "Materi Selesai",
                        AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: statCard(
                        Icons.bookmark_rounded,
                        "$bookmarkCount",
                        "Bookmark",
                        AppColors.orange,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                learningPath(),

                PremiumCard(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      Chip(label: Text("Flutter Web")),
                      Chip(label: Text("ListView")),
                      Chip(label: Text("Salomon Bottom Bar")),
                      Chip(label: Text("Shared Preferences")),
                      Chip(label: Text("Progress Tracker")),
                      Chip(label: Text("Bookmark Materi")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}