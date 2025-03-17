import 'package:team10_dhiraga/features/data/models/user_model.dart';

class MentorModel extends UserModel {
  final List<String> tipeMentor;
  final List<String> riwayatBeasiswa;
  final List<String> keahlian;
  final List<String> mediaMentoring;
  final List<String> dokumen;
  final List<String> ketersediaanHari;
  final List<String> ketersediaanJam;
  final double rating;
  late List<String> tags;

  MentorModel({
    required super.id,
    required super.username,
    required super.email,
    required super.profilePictureURL,
    required super.fullName,
    required super.pendidikan,
    required super.programStudi,
    required super.domisili,
    required super.alamatLengkap,
    required super.deskripsi,
    required super.role,
    required this.tipeMentor,
    required this.riwayatBeasiswa,
    required this.keahlian,
    required this.mediaMentoring,
    required this.ketersediaanHari,
    required this.ketersediaanJam,
    required this.dokumen,
    required this.rating,
  }) : super() {
    tags = _createTags(
      mediaMentoring: mediaMentoring,
      keahlian: keahlian,
      ketersediaanHari: ketersediaanHari,
      rating: rating,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['tipeMentor'] = tipeMentor;
    map['riwayatBeasiswa'] = riwayatBeasiswa;
    map['keahlian'] = keahlian;
    map['mediaMentoring'] = mediaMentoring;
    map['dokumen'] = dokumen;
    map['ketersediaanHari'] = ketersediaanHari;
    map['ketersediaanJam'] = ketersediaanJam;
    map['rating'] = rating;
    map['tags'] = tags;
    return map;
  }

  factory MentorModel.fromJson(Map<String, dynamic> json) {
    return MentorModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePictureURL: json['profilePictureURL'],
      fullName: json['fullName'],
      pendidikan: json['pendidikan'],
      programStudi: json['programStudi'],
      domisili: json['domisili'],
      alamatLengkap: json['alamatLengkap'],
      deskripsi: json['deskripsi'],
      role: json['role'],
      tipeMentor: List<String>.from(json['tipeMentor']),
      riwayatBeasiswa: List<String>.from(json['riwayatBeasiswa']),
      keahlian: List<String>.from(json['keahlian']),
      mediaMentoring: List<String>.from(json['mediaMentoring']),
      dokumen: List<String>.from(json['dokumen']),
      ketersediaanHari: List<String>.from(json['ketersediaanHari']),
      ketersediaanJam: List<String>.from(json['ketersediaanJam']),
      rating: json['rating'],
    );
  }

  factory MentorModel.empty(String? id) {
    return MentorModel(
      id: id ?? "",
      username: '',
      email: '',
      profilePictureURL: '',
      fullName: '',
      pendidikan: '',
      programStudi: '',
      domisili: '',
      alamatLengkap: '',
      deskripsi: '',
      role: 'mentor',
      tipeMentor: [],
      riwayatBeasiswa: [],
      keahlian: [],
      mediaMentoring: [],
      dokumen: [],
      ketersediaanHari: [],
      ketersediaanJam: [],
      rating: 0.0,
    );
  }

  @override
  bool isInitialized() {
    return super.isInitialized() &&
        tipeMentor.isNotEmpty &&
        riwayatBeasiswa.isNotEmpty &&
        keahlian.isNotEmpty &&
        mediaMentoring.isNotEmpty &&
        dokumen.isNotEmpty &&
        ketersediaanHari.isNotEmpty &&
        ketersediaanJam.isNotEmpty;
  }

  @override
  MentorModel copyWith({
    String? username,
    String? email,
    String? profilePictureURL,
    String? fullName,
    String? pendidikan,
    String? programStudi,
    String? domisili,
    String? alamatLengkap,
    String? deskripsi,
    String? role,
    List<String>? tipeMentor,
    List<String>? riwayatBeasiswa,
    List<String>? keahlian,
    List<String>? mediaMentoring,
    List<String>? dokumen,
    List<String>? ketersediaanHari,
    List<String>? ketersediaanJam,
    double? rating,
  }) {
    return MentorModel(
      id: id,
      username: username ?? this.username,
      email: email ?? this.email,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      fullName: fullName ?? this.fullName,
      pendidikan: pendidikan ?? this.pendidikan,
      programStudi: programStudi ?? this.programStudi,
      domisili: domisili ?? this.domisili,
      alamatLengkap: alamatLengkap ?? this.alamatLengkap,
      deskripsi: deskripsi ?? this.deskripsi,
      role: role ?? this.role,
      tipeMentor: tipeMentor ?? this.tipeMentor,
      riwayatBeasiswa: riwayatBeasiswa ?? this.riwayatBeasiswa,
      keahlian: keahlian ?? this.keahlian,
      mediaMentoring: mediaMentoring ?? this.mediaMentoring,
      dokumen: dokumen ?? this.dokumen,
      ketersediaanHari: ketersediaanHari ?? this.ketersediaanHari,
      ketersediaanJam: ketersediaanJam ?? this.ketersediaanJam,
      rating: rating ?? this.rating,
    );
  }

  List<String> _createTags({
    required List<String> mediaMentoring,
    required List<String> keahlian,
    required List<String> ketersediaanHari,
    required double rating,
  }) {
    return [
      ...mediaMentoring,
      ...keahlian,
      ...ketersediaanHari,
      rating.toString(),
    ];
  }
}
