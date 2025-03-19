//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:team10_dhiraga/di/injection_container.dart';
import 'package:team10_dhiraga/features/data/models/beasiswa_model.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';
import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_beasiswa.dart';
import 'package:team10_dhiraga/features/domain/usecases/get_mentors.dart';

Future<void> yesDeleteAllUserPlease() async {
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('users');

  try {
    // Get all documents in the collection
    final querySnapshot = await collectionRef.get();

    // Delete each document
    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    debugPrint('All users deleted successfully.');
  } catch (e) {
    debugPrint('Error deleting users: $e');
  }
}

Future<void> yesDeleteAllBeasiswaPlease() async {
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('beasiswa');

  try {
    // Get all documents in the collection
    final querySnapshot = await collectionRef.get();

    // Delete each document
    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    debugPrint('All beasiswa deleted successfully.');
  } catch (e) {
    debugPrint('Error deleting beasiswa: $e');
  }
}

Future<void> addDummyUsers() async {
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('users');

  List<MentorModel> dummyMentors = [
    MentorModel(
      id: '1',
      username: 'mentor1',
      email: 'mentor1@example.com',
      profilePictureURL: 'https://example.com/profile1.jpg',
      fullName: 'mentor one',
      pendidikan: 'S1',
      programStudi: 'informatika',
      domisili: 'jakarta',
      alamatLengkap: 'Jl. Sudirman No. 1',
      deskripsi: 'Experienced mentor in Informatika.',
      tipeMentor: ['Beasiswa', 'Akademik'],
      riwayatBeasiswa: ['beasiswa a', 'beasiswa b'],
      keahlian: ['Product manager', 'Inggris', 'Matematika'],
      mediaMentoring: ['Offline', 'Online'],
      mentoringAktif: [],
      riwayatMentoring: [],
      dokumen: ['https://google.com'],
      hargaMentoring: {
        'Offline': {4: 10000, 8: 60000},
        'Online': {4: 10000, 8: 60000},
      },
      ketersediaanHari: ['Senin', 'Rabu', 'Minggu'],
      ketersediaanJam: [
        '10.00-12.00',
        '13.00-14.00',
        '16.00-18.00',
        '19.00-21.00',
      ],
      rating: 4.3,
    ),
    MentorModel(
      id: '2',
      username: 'mentor2',
      email: 'mentor2@example.com',
      profilePictureURL: 'https://example.com/profile2.jpg',
      fullName: 'mentor two',
      pendidikan: 'S2',
      programStudi: 'manajemen',
      domisili: 'bandung',
      alamatLengkap: 'jl. dago no. 2',
      deskripsi: 'Experienced mentor in Manajemen.',
      tipeMentor: ['Akademik'],
      riwayatBeasiswa: ['beasiswa a', 'beasiswa c'],
      keahlian: ['Sejarah', 'Matematika'],
      mediaMentoring: ['Online'],
      dokumen: ['https://example.com/doc2.pdf'],
      hargaMentoring: {
        'Online': {4: 20000, 8: 80000},
      },
      ketersediaanHari: ['Selasa', 'Kamis'],
      ketersediaanJam: ['09.00-11.00', '14.00-16.00'],
      rating: 4.7,
      mentoringAktif: [],
      riwayatMentoring: [],
    ),
  ];

  for (var mentor in dummyMentors) {
    await collectionRef.add(mentor.toJson());
  }

  debugPrint('Dummy users added successfully.');
}

Future<void> addDummyBeasiswas() async {
  final firestore = FirebaseFirestore.instance;
  final collectionRef = firestore.collection('beasiswa');

  List<BeasiswaModel> dummyBeasiswas = [
    BeasiswaModel(
      id: '1',
      photoURL: 'https://photo.com',
      nama: 'Beasiswa A',
      mulai: Timestamp.now(),
      berakhir: Timestamp.now(),
      penyelenggara: 'Penyelenggara A',
      jenjang: ['S1', 'S2'],
      universitas: ['Universitas A', 'Universitas B'],
      manfaat: ['Manfaat A', 'Manfaat B'],
      syarat: ['Syarat A', 'Syarat B'],
      lampiran: ['Lampiran A', 'Lampiran B'],
      pembiayaan: ['Pembiayaan A', 'Pembiayaan B'],
      minimalIPK: 3.0,
      semester: [1, 2, 3],
      jumlahBookmark: 10,
    ),
    BeasiswaModel(
      id: '2',
      photoURL: 'https://photo.com',
      nama: 'Beasiswa B',
      mulai: Timestamp.now(),
      berakhir: Timestamp.now(),
      penyelenggara: 'Penyelenggara B',
      jenjang: ['S2', 'S3'],
      universitas: ['Universitas C', 'Universitas D'],
      manfaat: ['Manfaat C', 'Manfaat D'],
      syarat: ['Syarat C', 'Syarat D'],
      lampiran: ['Lampiran C', 'Lampiran D'],
      pembiayaan: ['Pembiayaan C', 'Pembiayaan D'],
      minimalIPK: 3.5,
      semester: [4, 5, 6],
      jumlahBookmark: 20,
    ),
  ];

  for (var beasiswa in dummyBeasiswas) {
    await collectionRef.add(beasiswa.toJson());
  }

  debugPrint('Dummy beasiswa added successfully.');
}

Future<void> DangerousTestingCommand() async {
  try {
    await yesDeleteAllUserPlease();
    await yesDeleteAllBeasiswaPlease();
    await addDummyUsers();
    await addDummyBeasiswas();
    await Future.delayed(Duration(seconds: 2));
    final getMentors = sl<GetMentors>();
    final getBeasiswas = sl<GetBeasiswas>();
    var mentors = await getMentors(
      GetMentorParams(online: true, offline: true),
    );

    debugPrint("Matched ${mentors.length} entries, Mentor");
    for (UserEntity m in mentors) {
      debugPrint(m.username);
    }

    var beasiswas = await getBeasiswas(
      GetBeasiswaParams(semester2: true, semester3: true),
    );

    debugPrint("Matched ${beasiswas.length} entries, Beasiswa");
    for (BeasiswaEntity b in beasiswas) {
      debugPrint(b.nama);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

void main() async {
  DangerousTestingCommand();
}
