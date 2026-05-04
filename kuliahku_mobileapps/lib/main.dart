import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'pages/home_page.dart';
import 'pages/meetings/meeting_list_page.dart';
import 'pages/profile_page.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const KuliahKuApp());
}

class KuliahKuApp extends StatelessWidget {
  const KuliahKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KuliahKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    MeetingListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text("Home"),
              selectedColor: AppColors.primary,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.menu_book_rounded),
              title: const Text("Materi"),
              selectedColor: AppColors.accent,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_rounded),
              title: const Text("Profile"),
              selectedColor: AppColors.orange,
            ),
          ],
        ),
      ),
    );
  }
}