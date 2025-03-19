import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';
import 'package:team10_dhiraga/features/data/constants/beasiswa_constants.dart';

class BeasiswaModel extends BeasiswaEntity {
  late List<String> tags;

  BeasiswaModel({
    required super.id,
    required super.photoURL,
    required super.mulai,
    required super.berakhir,
    required super.penyelenggara,
    required super.jenjang,
    required super.universitas,
    required super.manfaat,
    required super.syarat,
    required super.lampiran,
    required super.pembiayaan,
    required super.minimalIPK,
    required super.semester,
    required super.jumlahBookmark,
    required super.nama,
  }) : super() {
    tags = _createTags(jenjang, pembiayaan, minimalIPK, semester);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photoURL': photoURL,
      'mulai': mulai,
      'berakhir': berakhir,
      'penyelenggara': penyelenggara,
      'jenjang': jenjang,
      'universitas': universitas,
      'manfaat': manfaat,
      'syarat': syarat,
      'lampiran': lampiran,
      'pembiayaan': pembiayaan,
      'minimalIPK': minimalIPK,
      'semester': semester,
      'jumlahBookmark': jumlahBookmark,
      'nama': nama,
      'tags': tags,
    };
  }

  factory BeasiswaModel.fromJson(Map<String, dynamic> json) {
    return BeasiswaModel(
      id: json['id'],
      photoURL: json['photoURL'],
      mulai: json['mulai'],
      berakhir: json['berakhir'],
      penyelenggara: json['penyelenggara'],
      jenjang: List<String>.from(json['jenjang']),
      universitas: List<String>.from(json['universitas']),
      manfaat: List<String>.from(json['manfaat']),
      syarat: List<String>.from(json['syarat']),
      lampiran: List<String>.from(json['lampiran']),
      pembiayaan: List<String>.from(json['pembiayaan']),
      minimalIPK: json['minimalIPK'],
      semester: List<int>.from(json['semester']),
      jumlahBookmark: json['jumlahBookmark'],
      nama: json['nama'],
    );
  }

  factory BeasiswaModel.empty() {
    return BeasiswaModel(
      id: '',
      photoURL: '',
      mulai: Timestamp.now(),
      berakhir: Timestamp.now(),
      penyelenggara: '',
      jenjang: [],
      universitas: [],
      manfaat: [],
      syarat: [],
      lampiran: [],
      pembiayaan: [],
      minimalIPK: 0.0,
      semester: [],
      jumlahBookmark: 0,
      nama: '',
    );
  }

  @override
  bool isInitialized() {
    return id.isNotEmpty &&
        penyelenggara.isNotEmpty &&
        jenjang.isNotEmpty &&
        universitas.isNotEmpty &&
        manfaat.isNotEmpty &&
        syarat.isNotEmpty &&
        lampiran.isNotEmpty &&
        pembiayaan.isNotEmpty &&
        minimalIPK >= 0 &&
        semester.isNotEmpty &&
        nama.isNotEmpty;
  }

  BeasiswaModel copyWith({
    String? id,
    String? photoURL,
    Timestamp? mulai,
    Timestamp? berakhir,
    String? penyelenggara,
    List<String>? jenjang,
    List<String>? universitas,
    List<String>? manfaat,
    List<String>? syarat,
    List<String>? lampiran,
    List<String>? pembiayaan,
    double? minimalIPK,
    List<int>? semester,
    int? jumlahBookmark,
    String? nama,
  }) {
    return BeasiswaModel(
      id: id ?? this.id,
      photoURL: photoURL ?? this.photoURL,
      mulai: mulai ?? this.mulai,
      berakhir: berakhir ?? this.berakhir,
      penyelenggara: penyelenggara ?? this.penyelenggara,
      jenjang: jenjang ?? this.jenjang,
      universitas: universitas ?? this.universitas,
      manfaat: manfaat ?? this.manfaat,
      syarat: syarat ?? this.syarat,
      lampiran: lampiran ?? this.lampiran,
      pembiayaan: pembiayaan ?? this.pembiayaan,
      minimalIPK: minimalIPK ?? this.minimalIPK,
      semester: semester ?? this.semester,
      jumlahBookmark: jumlahBookmark ?? this.jumlahBookmark,
      nama: nama ?? this.nama,
    );
  }

  List<String> _createTags(
    List<String> jenjang,
    List<String> pembiayaan,
    double minimalIPK,
    List<int> semester,
  ) {
    List<String> tags = [];

    tags.addAll(jenjang);

    tags.addAll(pembiayaan);

    if (minimalIPK != 0) {
      tags.add(BeasiswaTag.denganMinimumIPK);
    }

    var sGreater6 = false;
    for (var s in semester) {
      if (s < 6) {
        tags.add("Semester $s");
      } else if (!sGreater6) {
        tags.add(BeasiswaTag.semester6);
        sGreater6 = true;
      }
    }
    return tags;
  }
}
