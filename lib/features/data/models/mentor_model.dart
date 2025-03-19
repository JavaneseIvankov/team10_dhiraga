import 'package:team10_dhiraga/features/data/models/user_model.dart';
import 'package:team10_dhiraga/features/data/constants/mentor_constants.dart';

class MentorModel extends UserModel {
  final List<String> tipeMentor;
  final List<String> riwayatBeasiswa;
  final List<String> keahlian;
  final List<String> mediaMentoring;
  final List<String> dokumen;
  final List<String> ketersediaanHari;
  final List<String> ketersediaanJam;
  final List<String> mentoringAktif;
  final List<String> riwayatMentoring;
  final double rating;
  final Map<String, Map<int, double>> hargaMentoring;
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
    required this.tipeMentor,
    required this.riwayatBeasiswa,
    required this.keahlian,
    required this.mediaMentoring,
    required this.ketersediaanHari,
    required this.ketersediaanJam,
    required this.dokumen,
    required this.mentoringAktif,
    required this.riwayatMentoring,
    required this.rating,
    required this.hargaMentoring,
  }) : super(role: 'mentor') {
    tags = _createTags(
      mediaMentoring: mediaMentoring,
      keahlian: keahlian,
      ketersediaanHari: ketersediaanHari,
      mentoringAktif: mentoringAktif,
      riwayatMentoring: riwayatMentoring,
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
    map['mentoringAktif'] = mentoringAktif;
    map['riwayatMentoring'] = riwayatMentoring;
    map['rating'] = rating;
    map['tags'] = tags;
    map['hargaMentoring'] = hargaMentoring.map(
      (key, value) =>
          MapEntry(key, value.map((k, v) => MapEntry(k.toString(), v))),
    );
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
      tipeMentor: List<String>.from(json['tipeMentor']),
      riwayatBeasiswa: List<String>.from(json['riwayatBeasiswa']),
      keahlian: List<String>.from(json['keahlian']),
      mediaMentoring: List<String>.from(json['mediaMentoring']),
      dokumen: List<String>.from(json['dokumen']),
      ketersediaanHari: List<String>.from(json['ketersediaanHari']),
      ketersediaanJam: List<String>.from(json['ketersediaanJam']),
      mentoringAktif: List<String>.from(json['mentoringAktif']),
      riwayatMentoring: List<String>.from(json['riwayatMentoring']),
      hargaMentoring:
          (json['hargaMentoring'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(
              key,
              (value as Map<String, dynamic>).map(
                (k, v) => MapEntry(int.parse(k), v as double),
              ),
            ),
          ) ??
          {},
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
      tipeMentor: [],
      riwayatBeasiswa: [],
      keahlian: [],
      mediaMentoring: [],
      dokumen: [],
      ketersediaanHari: [],
      ketersediaanJam: [],
      mentoringAktif: [],
      riwayatMentoring: [],
      hargaMentoring: {},
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
        ketersediaanJam.isNotEmpty &&
        mentoringAktif.isNotEmpty &&
        riwayatMentoring.isNotEmpty;
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
    List<String>? mentoringAktif,
    List<String>? riwayatMentoring,
    Map<String, Map<int, double>>? hargaMentoring,
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
      tipeMentor: tipeMentor ?? this.tipeMentor,
      riwayatBeasiswa: riwayatBeasiswa ?? this.riwayatBeasiswa,
      keahlian: keahlian ?? this.keahlian,
      mediaMentoring: mediaMentoring ?? this.mediaMentoring,
      dokumen: dokumen ?? this.dokumen,
      ketersediaanHari: ketersediaanHari ?? this.ketersediaanHari,
      ketersediaanJam: ketersediaanJam ?? this.ketersediaanJam,
      mentoringAktif: mentoringAktif ?? this.mentoringAktif,
      riwayatMentoring: riwayatMentoring ?? this.riwayatMentoring,
      hargaMentoring: hargaMentoring ?? this.hargaMentoring,
      rating: rating ?? this.rating,
    );
  }

  List<String> _createTags({
    required List<String> mediaMentoring,
    required List<String> keahlian,
    required List<String> ketersediaanHari,
    required List<String> mentoringAktif,
    required List<String> riwayatMentoring,
    required double rating,
  }) {
    var result = [
      ...mediaMentoring,
      ...keahlian,
      ...ketersediaanHari,
      ...mentoringAktif,
      ...riwayatMentoring,
    ];
    if (rating > 4.5) result.add(MentorTag.minimumRating);

    return result;
  }
}
