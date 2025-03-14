import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'package:team10_dhiraga/pages/login_page.dart';
import 'student_profile.dart';
import 'mentor_profile.dart';
import 'settings_page.dart';

class EditProfilePage extends StatelessWidget {
  final String userType; // 'student' atau 'mentor'

  const EditProfilePage({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:
            userType == 'student'
                ? _buildStudentProfile()
                : _buildMentorProfile(),
      ),
    );
  }

  Widget _buildStudentProfile() {
    return StudentProfile(
      onEducationChanged: (value) {},
      onStudyProgramChanged: (value) {},
      onDomicileChanged: (value) {},
      onFullAddressChanged: (value) {},
      onDescriptionChanged: (value) {},
    );
  }

  Widget _buildMentorProfile() {
    return MentorProfile(
      mentorBeasiswa: false,
      mentorAkademik: false,
      onMentorBeasiswaChanged: (value) {},
      onMentorAkademikChanged: (value) {},
      onScholarship1Changed: (value) {},
      onScholarship2Changed: (value) {},
      onSkillAdded: (value) {},
      onPickFiles: () {},
      uploadedFiles: [],
      mentoringOffline: false,
      mentoringOnline: false,
      onMentoringOfflineChanged: (value) {},
      onMentoringOnlineChanged: (value) {},
    );
  }
}

// Modifikasi SettingsPage untuk menghubungkan ke EditProfilePage
class SettingsPage extends StatelessWidget {
  final String userType; // 'student' atau 'mentor'

  const SettingsPage({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(userType: userType),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Hapus Akun"),
            onTap: () {
              _showDeleteAccountDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Apakah Anda yakin ingin logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ), // Ganti dengan halaman login
                );
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Akun"),
          content: Text("Apakah Anda yakin ingin menghapus akun ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                // Tambahkan fungsi hapus akun di sini
                Navigator.pop(context);
              },
              child: Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}
