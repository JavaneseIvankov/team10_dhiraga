import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/constants/mentor_constants.dart';
import 'package:team10_dhiraga/features/data/models/mentor_update_params.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';
import 'package:team10_dhiraga/pages/login_page.dart'; // Import halaman login

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

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tipeMentor = {
      MentorTag.beasiswa: _mentorBeasiswa,
      MentorTag.akademik: _mentorAkademik,
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
            setState(() {
              _currentPage = 2; // Pindah ke halaman ketiga setelah submit
            });
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

  Widget _buildPage1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Lengkapi Profilmu',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.add_a_photo, size: 40),
          ),
          SizedBox(height: 20),
          TextField(
            controller: namaPanggilanController,
            decoration: InputDecoration(
              labelText: 'Nama Panggilan',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: pendidikanController,
            decoration: InputDecoration(
              labelText: 'Pendidikan',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: programStudiController,
            decoration: InputDecoration(
              labelText: 'Program Studi',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: domisiliController,
            decoration: InputDecoration(
              labelText: 'Domisili',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: alamatLengkapController,
            decoration: InputDecoration(
              labelText: 'Alamat Lengkap',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: deskripsiController,
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(),
              hintMaxLines: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Mendaftar Sebagai?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CheckboxListTile(
            title: Text('Mentor Beasiswa'),
            value: _mentorBeasiswa,
            onChanged: (value) {
              setState(() {
                _mentorBeasiswa =
                    value ?? false; // Nilai default false jika null
              });
            },
          ),
          CheckboxListTile(
            title: Text('Mentor Akademik'),
            value: _mentorAkademik,
            onChanged: (value) {
              setState(() {
                _mentorAkademik =
                    value ?? false; // Nilai default false jika null
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Keahlian',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8.0,
            children:
                _skills.keys.map((skill) {
                  return FilterChip(
                    label: Text(skill),
                    selected:
                        _skills[skill] ?? false, // Pastikan nilai tidak null
                    onSelected: (value) {
                      setState(() {
                        _skills[skill] = value; // Tidak perlu penanganan khusus
                      });
                    },
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Bahasa',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8.0,
            children:
                _languages.keys.map((language) {
                  return FilterChip(
                    label: Text(language),
                    selected:
                        _languages[language] ??
                        false, // Pastikan nilai tidak null
                    onSelected: (value) {
                      setState(() {
                        _languages[language] =
                            value; // Tidak perlu penanganan khusus
                      });
                    },
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Matpel',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8.0,
            children:
                _subjects.keys.map((subject) {
                  return FilterChip(
                    label: Text(subject),
                    selected:
                        _subjects[subject] ??
                        false, // Pastikan nilai tidak null
                    onSelected: (value) {
                      setState(() {
                        _subjects[subject] =
                            value; // Tidak perlu penanganan khusus
                      });
                    },
                  );
                }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Upload CV, Portofolio, Sertifikat (maks 10 file)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: () {
              // Handle file upload
            },
          ),
          SizedBox(height: 20),
          Text(
            'Bersedia Mentoring Offline / Online?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CheckboxListTile(
            title: Text('Mentor Offline'),
            value: _mentorOffline,
            onChanged: (value) {
              setState(() {
                _mentorOffline =
                    value ?? false; // Nilai default false jika null
              });
            },
          ),
          CheckboxListTile(
            title: Text('Mentor Online'),
            value: _mentorOnline,
            onChanged: (value) {
              setState(() {
                _mentorOnline = value ?? false; // Nilai default false jika null
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPage3() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Akun Berhasil Dibuat!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Form Mentor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child:
                  _currentPage == 0
                      ? _buildPage1()
                      : _currentPage == 1
                      ? _buildPage2()
                      : _buildPage3(),
            ),
            if (_currentPage < 2)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_currentPage > 0)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentPage--;
                          });
                        },
                        child: Text('Kembali'),
                      ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_currentPage == 1) {
                          _submitForm(userProvider);
                        } else {
                          setState(() {
                            _currentPage++;
                          });
                        }
                      },
                      child: Text(_currentPage == 1 ? 'Submit' : 'Selanjutnya'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
