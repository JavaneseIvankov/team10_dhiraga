import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BeasiswaEntity {
  final String id;
  final String photoURL;
  final Timestamp mulai;
  final Timestamp berakhir;
  final String penyelenggara;
  final List<String> jenjang;
  final List<String> universitas;
  final List<String> manfaat;
  final List<String> syarat;
  final List<String> lampiran;
  final List<String> pembiayaan;
  final double minimalIPK;
  final List<int> semester;
  final int jumlahBookmark;
  final String nama;

  BeasiswaEntity({
    required this.id,
    required this.photoURL,
    required this.mulai,
    required this.berakhir,
    required this.penyelenggara,
    required this.jenjang,
    required this.universitas,
    required this.manfaat,
    required this.syarat,
    required this.lampiran,
    required this.pembiayaan,
    required this.minimalIPK,
    required this.semester,
    required this.jumlahBookmark,
    required this.nama,
  });

  Map<String, dynamic> toJson();

  factory BeasiswaEntity.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() must be implemented in subclasses');
  }

  factory BeasiswaEntity.empty() {
    throw UnimplementedError('empty() must be implemented in subclasses');
  }

  bool isInitialized();
}
