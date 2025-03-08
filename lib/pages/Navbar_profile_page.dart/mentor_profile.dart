import 'package:flutter/material.dart';

class MentorProfile extends StatelessWidget {
  final bool mentorBeasiswa;
  final bool mentorAkademik;
  final Function(bool) onMentorBeasiswaChanged;
  final Function(bool) onMentorAkademikChanged;
  final Function(String) onScholarship1Changed;
  final Function(String) onScholarship2Changed;
  final Function(String) onSkillAdded;
  final VoidCallback onPickFiles;
  final List<String> uploadedFiles;
  final bool mentoringOffline;
  final bool mentoringOnline;
  final Function(bool) onMentoringOfflineChanged;
  final Function(bool) onMentoringOnlineChanged;

  MentorProfile({
    required this.mentorBeasiswa,
    required this.mentorAkademik,
    required this.onMentorBeasiswaChanged,
    required this.onMentorAkademikChanged,
    required this.onScholarship1Changed,
    required this.onScholarship2Changed,
    required this.onSkillAdded,
    required this.onPickFiles,
    required this.uploadedFiles,
    required this.mentoringOffline,
    required this.mentoringOnline,
    required this.onMentoringOfflineChanged,
    required this.onMentoringOnlineChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Mendaftar Sebagai?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CheckboxListTile(
          title: Text("Mentor Beasiswa"),
          value: mentorBeasiswa,
          onChanged: (val) => onMentorBeasiswaChanged(val!),
        ),
        CheckboxListTile(
          title: Text("Mentor Akademik"),
          value: mentorAkademik,
          onChanged: (val) => onMentorAkademikChanged(val!),
        ),
        _buildTextField("Riwayat Beasiswa 1", onScholarship1Changed),
        _buildTextField("Riwayat Beasiswa 2", onScholarship2Changed),
        SizedBox(height: 16),
        Text("Keahlian", style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButtonFormField<String>(
          items:
              ["Product Manager", "UI/UX", "Front End", "Back End"]
                  .map(
                    (skill) =>
                        DropdownMenuItem(value: skill, child: Text(skill)),
                  )
                  .toList(),
          onChanged: (val) => onSkillAdded(val!),
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        SizedBox(height: 16),
        Text(
          "Upload CV, Portofolio, Sertifikat (maks 10 file)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ElevatedButton(onPressed: onPickFiles, child: Text("Upload File")),
        Wrap(
          children:
              uploadedFiles.map((file) => Chip(label: Text(file))).toList(),
        ),
        SizedBox(height: 16),
        Text(
          "Bersedia Mentoring Offline / Online?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        CheckboxListTile(
          title: Text("Mentor Offline"),
          value: mentoringOffline,
          onChanged: (val) => onMentoringOfflineChanged(val!),
        ),
        CheckboxListTile(
          title: Text("Mentor Online"),
          value: mentoringOnline,
          onChanged: (val) => onMentoringOnlineChanged(val!),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
