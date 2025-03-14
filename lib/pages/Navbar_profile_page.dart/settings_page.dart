import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class SettingsPage extends StatefulWidget {
  final VoidCallback onEditProfile;

  const SettingsPage({super.key, required this.onEditProfile});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifBeasiswa = true;
  bool notifEvent = true;
  bool notifGeneral = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengaturan")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Pengaturan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          _buildSwitchTile(
            icon: Icons.school,
            title: "Notifikasi Beasiswa",
            value: notifBeasiswa,
            onChanged: (val) => setState(() => notifBeasiswa = val),
          ),
          _buildSwitchTile(
            icon: Icons.event,
            title: "Notifikasi Event",
            value: notifEvent,
            onChanged: (val) => setState(() => notifEvent = val),
          ),
          _buildSwitchTile(
            icon: Icons.notifications,
            title: "Notifikasi Umum",
            value: notifGeneral,
            onChanged: (val) => setState(() => notifGeneral = val),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile"),
            onTap: widget.onEditProfile,
          ),
          _buildListTile(icon: Icons.help, title: "Bantuan"),
          _buildListTile(icon: Icons.feedback, title: "Masukan"),
          _buildListTile(icon: Icons.delete, title: "Hapus Akun"),
          _buildListTile(icon: Icons.logout, title: "Logout"),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildListTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Tambahkan logika untuk setiap item
      },
    );
  }
}
