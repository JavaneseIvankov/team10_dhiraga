import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/constants/mentor_constants.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';

class FormMentor extends StatefulWidget {
  const FormMentor({super.key});

  @override
  _FormMentorState createState() => _FormMentorState();
}

class _FormMentorState extends State<FormMentor> {
  final userRepository = sl<UserRepository>();
  late final Map<String, bool> _tipeMentor;
  late final Map<String, bool> _skills;
  late final Map<String, bool> _languages;
  late final Map<String, bool> _subjects;

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
  bool _mentorOffline = false;
  bool _mentorOnline = false;

  @override
  void initState() {
    super.initState();
    _tipeMentor = {
      MentorTag.beasiswa: _mentorBeasiswa,
      MentorTag.akadamik: _mentorAkademik,
      MentorTag.offline: _mentorOffline,
      MentorTag.online: _mentorOnline,
    };
    _skills = {
      MentorTag.productManager: false,
      MentorTag.backEnd: false,
      MentorTag.frontEnd: false,
      MentorTag.uiUx: false,
    };
    _languages = {
      MentorTag.inggris: false,
      MentorTag.jerman: false,
      MentorTag.korea: false,
      MentorTag.jepang: false,
    };
    _subjects = {
      MentorTag.biologi: false,
      MentorTag.fisika: false,
      MentorTag.kimia: false,
      MentorTag.matematika: false,
      MentorTag.sejarah: false,
    };
  }

  Map<String, bool> _getKeahlian() {
    final Map<String, bool> keahlian = {};
    keahlian.addAll(_tipeMentor);
    keahlian.addAll(_skills);
    keahlian.addAll(_languages);
    keahlian.addAll(_subjects);
    return keahlian;
  }

  List<String> _getRiwayatBeasiswa() {
    final List<String> riwayat = [];
    final riwayat1 = riwayatBeasiswa1Controller.text;
    final riwayat2 = riwayatBeasiswa2Controller.text;
    if (riwayat1.isNotEmpty) riwayat.add(riwayat1);
    if (riwayat2.isNotEmpty) riwayat.add(riwayat2);
    return riwayat;
  }

  Map<String, bool> _getMediaMentoring() {
    final online = _mentorOnline;
    final offline = _mentorOffline;
    return {MentorTag.online: online, MentorTag.offline: offline};
  }

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
            riwayatBeasiswa: _getRiwayatBeasiswa(),
            tipeMentor: _tipeMentor,
            keahlian: _getKeahlian(),
            mediaMentoring: _getMediaMentoring(),
          ),
        )
        .then((_) {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              // TODO: apa ini?
              MaterialPageRoute(
                builder:
                    (context) => HomePage(
                      savedNotifications: [],
                      addNotification: (list) => {},
                    ),
              ),
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
