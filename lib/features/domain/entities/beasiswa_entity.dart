import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BeasiswaEntity {
  final String id;
  final Timestamp mulai;
  final Timestamp berakhir;
  final String penyelenggara;
  final List<String> jenjang;
  final List<String> universitas;
  final List<String> manfaat;
  final List<String> syarat;
  final List<String> lampiran;
  final int jumlahBookmark;

  BeasiswaEntity({
    required this.id,
    required this.mulai,
    required this.berakhir,
    required this.penyelenggara,
    required this.jenjang,
    required this.universitas,
    required this.manfaat,
    required this.syarat,
    required this.lampiran,
    required this.jumlahBookmark,
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
