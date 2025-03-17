import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/data/models/student_update_params.dart';
import 'package:team10_dhiraga/features/domain/entities/auth_user_entity.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/pages/Navbar_home_page.dart/home_page.dart';

class FormStudent extends StatefulWidget {
  const FormStudent({super.key});

  @override
  _FormStudentState createState() => _FormStudentState();
}

class _FormStudentState extends State<FormStudent> {
  final userRepository = sl<UserRepository>();

  final TextEditingController pendidikanController = TextEditingController();
  final TextEditingController programStudiController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();
  final TextEditingController alamatLengkapController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  // TODO: Implement username
  void _submitForm(String? userId) async {
    if (userId == null) return;
    userRepository
        .updateStudent(
          userId,
          StudentUpdateParams(
            username: "test_name",
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
    pendidikanController.dispose();
    programStudiController.dispose();
    domisiliController.dispose();
    alamatLengkapController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserEntity?>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Form Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              onPressed: () => _submitForm(currentUser?.id ?? ""),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
