import 'package:team10_dhiraga/features/data/models/user_model.dart';

class MentorModel extends UserModel {
  final Map<String, bool> tipeMentor;
  final List<String> riwayatBeasiswa;
  final Map<String, bool> keahlian;
  final Map<String, bool> mediaMentoring;
  final List<String> dokumen;

  MentorModel({
    required String username,
    required String email,
    required String profilePictureURL,
    required String fullName,
    required String pendidikan,
    required String programStudi,
    required String domisili,
    required String alamatLengkap,
    required String deskripsi,
    required this.tipeMentor,
    required this.riwayatBeasiswa,
    required this.keahlian,
    required this.mediaMentoring,
    required this.dokumen,
  }) : super(
         username: username,
         email: email,
         profilePictureURL: profilePictureURL,
         fullName: fullName,
         pendidikan: pendidikan,
         programStudi: programStudi,
         domisili: domisili,
         alamatLengkap: alamatLengkap,
         deskripsi: deskripsi,
       );

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['tipeMentor'] = tipeMentor;
    map['riwayatBeasiswa'] = riwayatBeasiswa;
    map['keahlian'] = keahlian;
    map['mediaMentoring'] = mediaMentoring;
    map['dokumen'] = dokumen;
    return map;
  }

  factory MentorModel.fromJson(Map<String, dynamic> json) {
    return MentorModel(
      username: json['username'],
      email: json['email'],
      profilePictureURL: json['profilePictureURL'],
      fullName: json['fullName'],
      pendidikan: json['pendidikan'],
      programStudi: json['programStudi'],
      domisili: json['domisili'],
      alamatLengkap: json['alamatLengkap'],
      deskripsi: json['deskripsi'],
      tipeMentor: Map<String, bool>.from(json['tipeMentor']),
      riwayatBeasiswa: List<String>.from(json['riwayatBeasiswa']),
      keahlian: Map<String, bool>.from(json['keahlian']),
      mediaMentoring: Map<String, bool>.from(json['mediaMentoring']),
      dokumen: List<String>.from(json['dokumen']),
    );
  }
}
