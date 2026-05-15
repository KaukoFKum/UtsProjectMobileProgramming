import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_colors.dart';
import '../widgets/app_header.dart';
import '../widgets/premium_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker picker = ImagePicker();

  bool isEditMode = false;
  bool isAvatarHover = false;

  final namaController =
      TextEditingController(text: "Kauko Fitra Kumaratama");
  final nimController = TextEditingController(text: "241011700803");
  final kelasController = TextEditingController(text: "04SIFE008");
  final prodiController = TextEditingController(text: "Sistem Informasi");

  final roleController = TextEditingController(
    text: "Manager Core Datacomm Assurance | Network & Mobile App Enthusiast",
  );

  final skillController = TextEditingController(
    text:
        "Flutter, PHP, MySQL, UI Design, Laravel, Unix, Cisco Networking, Java, 4G Core Network",
  );

  final hobiController = TextEditingController(
    text: "Ngaji 1week1Juz, Coding, Golf, Belajar Teknologi, Lari, Padel",
  );

  Uint8List? profileImageBytes;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  @override
  void dispose() {
    namaController.dispose();
    nimController.dispose();
    kelasController.dispose();
    prodiController.dispose();
    roleController.dispose();
    skillController.dispose();
    hobiController.dispose();
    super.dispose();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      namaController.text =
          prefs.getString("profile_nama") ?? "Kauko Fitra Kumaratama";

      nimController.text =
          prefs.getString("profile_nim") ?? "241011700803";

      kelasController.text =
          prefs.getString("profile_kelas") ?? "04SIFE008";

      prodiController.text =
          prefs.getString("profile_prodi") ?? "Sistem Informasi";

      roleController.text = prefs.getString("profile_role") ??
          "Manager Core Datacomm Assurance | Network & Mobile App Enthusiast";

      skillController.text = prefs.getString("profile_skill") ??
          "Flutter, PHP, MySQL, UI Design, Laravel, Unix, Cisco Networking, Java, 4G Core Network";

      hobiController.text = prefs.getString("profile_hobi") ??
          "Ngaji 1week1Juz, Coding, Golf, Belajar Teknologi, Lari, Padel";

      final imageBase64 = prefs.getString("profile_image");
      if (imageBase64 != null) {
        profileImageBytes = base64Decode(imageBase64);
      }
    });
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("profile_nama", namaController.text);
    await prefs.setString("profile_nim", nimController.text);
    await prefs.setString("profile_kelas", kelasController.text);
    await prefs.setString("profile_prodi", prodiController.text);
    await prefs.setString("profile_role", roleController.text);
    await prefs.setString("profile_skill", skillController.text);
    await prefs.setString("profile_hobi", hobiController.text);

    setState(() {
      isEditMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile berhasil disimpan")),
    );
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) return;

    final bytes = await image.readAsBytes();
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("profile_image", base64Encode(bytes));

    setState(() {
      profileImageBytes = bytes;
    });
  }

  List<String> splitList(String value) {
    return value
        .split(",")
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  List<String> skillProgramming() {
    final all = splitList(skillController.text);

    return all
        .where(
          (e) => [
            "Flutter",
            "PHP",
            "MySQL",
            "UI Design",
            "Laravel",
            "Java",
          ].contains(e),
        )
        .toList();
  }

  List<String> skillNetworking() {
    final all = splitList(skillController.text);

    return all
        .where(
          (e) => [
            "Unix",
            "Cisco Networking",
            "4G Core Network",
          ].contains(e),
        )
        .toList();
  }

  Widget profileImage() {
    return MouseRegion(
      onEnter: (_) => setState(() => isAvatarHover = true),
      onExit: (_) => setState(() => isAvatarHover = false),
      child: AnimatedScale(
        scale: isAvatarHover ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 74,
                backgroundColor: Colors.white,
                backgroundImage: profileImageBytes != null
                    ? MemoryImage(profileImageBytes!)
                    : const AssetImage('assets/images/profile.jpg')
                        as ImageProvider,
              ),
            ),
            Positioned(
              right: 4,
              bottom: 4,
              child: InkWell(
                onTap: pickImage,
                borderRadius: BorderRadius.circular(99),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.35),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editableField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    if (!isEditMode) {
      return infoTile(icon, label, controller.text);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }

  Widget infoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
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
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chipGroup(
    String title,
    IconData icon,
    List<String> items,
    Color color,
  ) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: items.map((item) {
              return Chip(
                avatar: Icon(
                  Icons.check_circle_rounded,
                  size: 17,
                  color: color,
                ),
                label: Text(item),
                backgroundColor: Colors.white,
                side: BorderSide(color: color.withOpacity(0.20)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget statBox(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.22)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
            Text(label, style: const TextStyle(color: AppColors.muted)),
          ],
        ),
      ),
    );
  }

  Widget aboutBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.10),
            AppColors.secondary.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.primary.withOpacity(0.10)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded, color: AppColors.primary),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Saya sedang membangun aplikasi KuliahKu sebagai media pembelajaran Mobile Programming berbasis Flutter Web. Aplikasi ini dirancang agar materi kuliah lebih interaktif, terstruktur, dan mudah dipelajari.",
              style: TextStyle(
                color: AppColors.muted,
                height: 1.7,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final skills = splitList(skillController.text);
    final hobbies = splitList(hobiController.text);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const AppHeader(
                    title: "Profile Mahasiswa",
                    subtitle: "Identitas pembuat aplikasi KuliahKu",
                    icon: Icons.person_rounded,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: PremiumCard(
                          padding: const EdgeInsets.all(28),
                          child: Column(
                            children: [
                              profileImage(),
                              const SizedBox(height: 18),
                              Text(
                                namaController.text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Mahasiswa ${prodiController.text}",
                                style: const TextStyle(
                                  color: AppColors.muted,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(99),
                                  border: Border.all(
                                    color: AppColors.primary.withOpacity(0.12),
                                  ),
                                ),
                                child: Text(
                                  roleController.text,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  statBox(
                                    "8",
                                    "Materi",
                                    Icons.menu_book_rounded,
                                    AppColors.primary,
                                  ),
                                  const SizedBox(width: 12),
                                  statBox(
                                    "${skills.length}",
                                    "Skill",
                                    Icons.psychology_rounded,
                                    AppColors.accent,
                                  ),
                                  const SizedBox(width: 12),
                                  statBox(
                                    "${hobbies.length}",
                                    "Hobi",
                                    Icons.favorite_rounded,
                                    AppColors.orange,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              aboutBox(),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Last updated: 2026",
                                  style: TextStyle(
                                    color: AppColors.muted,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (isEditMode) {
                                      saveProfile();
                                    } else {
                                      setState(() {
                                        isEditMode = true;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    isEditMode
                                        ? Icons.save_rounded
                                        : Icons.edit_rounded,
                                  ),
                                  label: Text(
                                    isEditMode
                                        ? "Simpan Profile"
                                        : "Edit Profile",
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                              ),
                              if (isEditMode) ...[
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        isEditMode = false;
                                      });
                                    },
                                    icon: const Icon(Icons.close_rounded),
                                    label: const Text("Batal Edit"),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            PremiumCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Informasi Mahasiswa",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  editableField(
                                    "Nama Lengkap",
                                    namaController,
                                    Icons.person_rounded,
                                  ),
                                  editableField(
                                    "NIM",
                                    nimController,
                                    Icons.badge_rounded,
                                  ),
                                  editableField(
                                    "Kelas",
                                    kelasController,
                                    Icons.class_rounded,
                                  ),
                                  editableField(
                                    "Program Studi",
                                    prodiController,
                                    Icons.school_rounded,
                                  ),
                                  editableField(
                                    "Role / Title",
                                    roleController,
                                    Icons.workspace_premium_rounded,
                                  ),
                                ],
                              ),
                            ),
                            PremiumCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Skill",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  if (isEditMode)
                                    editableField(
                                      "Skill, pisahkan dengan koma",
                                      skillController,
                                      Icons.psychology_rounded,
                                    )
                                  else ...[
                                    chipGroup(
                                      "Programming & App Development",
                                      Icons.code_rounded,
                                      skillProgramming(),
                                      AppColors.primary,
                                    ),
                                    chipGroup(
                                      "Network & Telco",
                                      Icons.router_rounded,
                                      skillNetworking(),
                                      AppColors.accent,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            PremiumCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Hobi",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  if (isEditMode)
                                    editableField(
                                      "Hobi, pisahkan dengan koma",
                                      hobiController,
                                      Icons.favorite_rounded,
                                    )
                                  else
                                    chipGroup(
                                      "Personal Interest",
                                      Icons.favorite_rounded,
                                      hobbies,
                                      AppColors.orange,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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