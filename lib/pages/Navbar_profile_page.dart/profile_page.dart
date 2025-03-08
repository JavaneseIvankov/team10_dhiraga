import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'mentor_profile.dart';
import 'student_profile.dart';

class ProfilePage extends StatefulWidget {
  final bool isMentor;

  ProfilePage({required this.isMentor});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? education, studyProgram, domicile, fullAddress, description;
  bool mentorBeasiswa = false;
  bool mentorAkademik = false;
  String? scholarship1, scholarship2;
  List<String> skills = [];
  bool mentoringOffline = false;
  bool mentoringOnline = false;
  List<String> uploadedFiles = [];
  File? profilePicture;

  Future<void> _pickProfilePicture() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        profilePicture = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Profil berhasil disimpan!")));
  }

  @override
  Widget build(BuildContext context) {
    print("User adalah mentor: ${widget.isMentor}"); // Debugging tambahan

    return Scaffold(
      appBar: AppBar(
        title: Text("Lengkapi Profilmu!"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickProfilePicture,
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    profilePicture != null ? FileImage(profilePicture!) : null,
                child:
                    profilePicture == null
                        ? Icon(Icons.camera_alt, size: 50, color: Colors.white)
                        : null,
              ),
            ),
            SizedBox(height: 16),

            if (widget.isMentor)
              MentorProfile(
                mentorBeasiswa: mentorBeasiswa,
                mentorAkademik: mentorAkademik,
                onMentorBeasiswaChanged: (val) {
                  setState(() => mentorBeasiswa = val);
                },
                onMentorAkademikChanged: (val) {
                  setState(() => mentorAkademik = val);
                },
                onScholarship1Changed: (val) {
                  setState(() => scholarship1 = val);
                },
                onScholarship2Changed: (val) {
                  setState(() => scholarship2 = val);
                },
                onSkillAdded: (val) {
                  setState(() => skills.add(val));
                },
                onPickFiles: () {},
                uploadedFiles: uploadedFiles,
                mentoringOffline: mentoringOffline,
                mentoringOnline: mentoringOnline,
                onMentoringOfflineChanged: (val) {
                  setState(() => mentoringOffline = val);
                },
                onMentoringOnlineChanged: (val) {
                  setState(() => mentoringOnline = val);
                },
              )
            else
              StudentProfile(
                onEducationChanged: (val) {
                  setState(() => education = val);
                },
                onStudyProgramChanged: (val) {
                  setState(() => studyProgram = val);
                },
                onDomicileChanged: (val) {
                  setState(() => domicile = val);
                },
                onFullAddressChanged: (val) {
                  setState(() => fullAddress = val);
                },
                onDescriptionChanged: (val) {
                  setState(() => description = val);
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveProfile,
        child: Icon(Icons.save),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
