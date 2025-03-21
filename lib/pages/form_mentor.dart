import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/main.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';

class FormMentor extends StatefulWidget {
  const FormMentor({super.key});

  @override
  _FormMentorState createState() => _FormMentorState();
}

class _FormMentorState extends State<FormMentor> {
  final userRepository = sl<UserRepository>();

  final TextEditingController namaPanggilanController = TextEditingController();
  final TextEditingController pendidikanController = TextEditingController();
  final TextEditingController programStudiController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();
  final TextEditingController alamatLengkapController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController riwayatBeasiswa1Controller =
      TextEditingController();
  final TextEditingController riwayatBeasiswa2Controller =
      TextEditingController();

  bool _mentorBeasiswa = false;
  bool _mentorAkademik = false;
  Map<String, bool> _skills = {
    'Product manager': false,
    'Back end': false,
    'Front end': false,
    'UI/UX': false,
  };
  Map<String, bool> _languages = {
    'Inggris': false,
    'Jerman': false,
    'Korea': false,
    'Jepang': false,
  };
  Map<String, bool> _subjects = {
    'Biologi': false,
    'Fisika': false,
    'Kimia': false,
    'Matematika': false,
    'Sejarah': false,
  };
  bool _mentorOffline = false;
  bool _mentorOnline = false;

  void _submitForm(UserProvider userProvider) async {
    final user = await userProvider.currentUser;
    final userId = user?.id;

    if (user == null || userId == null) return;

    userRepository
        .updateMentor(
          userId,
          MentorUpdateParams(
            username: namaPanggilanController.text,
            pendidikan: pendidikanController.text,
            programStudi: programStudiController.text,
            domisili: domisiliController.text,
            alamatLengkap: alamatLengkapController.text,
            deskripsi: deskripsiController.text,
            riwayatBeasiswa1: riwayatBeasiswa1Controller.text,
            riwayatBeasiswa2: riwayatBeasiswa2Controller.text,
            mentorBeasiswa: _mentorBeasiswa,
            mentorAkademik: _mentorAkademik,
            skills: _skills,
            languages: _languages,
            subjects: _subjects,
            mentorOffline: _mentorOffline,
            mentorOnline: _mentorOnline,
          ),
        )
        .then((_) {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        });
  }

  @override
  void dispose() {
    namaPanggilanController.dispose();
    pendidikanController.dispose();
    programStudiController.dispose();
    domisiliController.dispose();
    alamatLengkapController.dispose();
    deskripsiController.dispose();
    riwayatBeasiswa1Controller.dispose();
    riwayatBeasiswa2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Form Mentor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: namaPanggilanController,
              decoration: const InputDecoration(labelText: 'Nama Panggilan'),
            ),
            TextField(
              controller: pendidikanController,
              decoration: const InputDecoration(labelText: 'Pendidikan'),
            ),
            TextField(
              controller: programStudiController,
              decoration: const InputDecoration(labelText: 'Program Studi'),
            ),
            TextField(
              controller: domisiliController,
              decoration: const InputDecoration(labelText: 'Domisili'),
            ),
            TextField(
              controller: alamatLengkapController,
              decoration: const InputDecoration(labelText: 'Alamat Lengkap'),
            ),
            TextField(
              controller: deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Text(
              'Riwayat Beasiswa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: riwayatBeasiswa1Controller,
              decoration: const InputDecoration(
                labelText: 'Riwayat Beasiswa 1',
              ),
            ),
            TextField(
              controller: riwayatBeasiswa2Controller,
              decoration: const InputDecoration(
                labelText: 'Riwayat Beasiswa 2',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Mendaftar Sebagai?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Mentor Beasiswa'),
              value: _mentorBeasiswa,
              onChanged: (value) {
                setState(() {
                  _mentorBeasiswa = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Mentor Akademik'),
              value: _mentorAkademik,
              onChanged: (value) {
                setState(() {
                  _mentorAkademik = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Keahlian',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ..._skills.keys.map((skill) {
              return CheckboxListTile(
                title: Text(skill),
                value: _skills[skill],
                onChanged: (value) {
                  setState(() {
                    _skills[skill] = value!;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 20),
            Text(
              'Bahasa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ..._languages.keys.map((language) {
              return CheckboxListTile(
                title: Text(language),
                value: _languages[language],
                onChanged: (value) {
                  setState(() {
                    _languages[language] = value!;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 20),
            Text(
              'Matpel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ..._subjects.keys.map((subject) {
              return CheckboxListTile(
                title: Text(subject),
                value: _subjects[subject],
                onChanged: (value) {
                  setState(() {
                    _subjects[subject] = value!;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 20),
            Text(
              'Upload CV, Portofolio, Sertifikat (maks 10 file)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle file upload
              },
              child: Text('Upload File'),
            ),
            const SizedBox(height: 20),
            Text(
              'Bersedia Mentoring Offline / Online?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Mentor Offline'),
              value: _mentorOffline,
              onChanged: (value) {
                setState(() {
                  _mentorOffline = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Mentor Online'),
              value: _mentorOnline,
              onChanged: (value) {
                setState(() {
                  _mentorOnline = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitForm(userProvider),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
