import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/presentation/providers/user_provider.dart';
import 'package:team10_dhiraga/main.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';

class FormStudent extends StatefulWidget {
  const FormStudent({super.key});

  @override
  _FormStudentState createState() => _FormStudentState();
}

class _FormStudentState extends State<FormStudent> {
  final userRepository = sl<UserRepository>();

  final TextEditingController namaPanggianController = TextEditingController();
  final TextEditingController pendidikanController = TextEditingController();
  final TextEditingController programStudiController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();
  final TextEditingController alamatLengkapController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  void _submitForm(UserProvider userProvider) async {
    final user = await userProvider.currentUser;
    final userId = user?.id;

    if (user == null || userId == null) return;
    userRepository
        .updateStudent(
          userId,
          StudentUpdateParams(
            username: namaPanggianController.text,
            pendidikan: pendidikanController.text,
            programStudi: programStudiController.text,
            domisili: domisiliController.text,
            alamatLengkap: alamatLengkapController.text,
            deskripsi: deskripsiController.text,
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
    namaPanggianController.dispose();
    pendidikanController.dispose();
    programStudiController.dispose();
    domisiliController.dispose();
    alamatLengkapController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Form Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: namaPanggianController,
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
