<<<<<<< HEAD
// TODO Implement this library.
=======
import 'package:team10_dhiraga/features/data/models/user_model.dart';

class MentorModel extends UserModel {
  final Map<String, bool> tipeMentor;
  final List<String> riwayatBeasiswa;
  final Map<String, bool> keahlian;
  final Map<String, bool> mediaMentoring;
  final List<String> dokumen;

  MentorModel({
    required String id,
    required String username,
    required String email,
    required String profilePictureURL,
    required String fullName,
    required String pendidikan,
    required String programStudi,
    required String domisili,
    required String alamatLengkap,
    required String deskripsi,
    required String role,
    required this.tipeMentor,
    required this.riwayatBeasiswa,
    required this.keahlian,
    required this.mediaMentoring,
    required this.dokumen,
  }) : super(
         id: id,
         username: username,
         email: email,
         profilePictureURL: profilePictureURL,
         fullName: fullName,
         pendidikan: pendidikan,
         programStudi: programStudi,
         domisili: domisili,
         alamatLengkap: alamatLengkap,
         deskripsi: deskripsi,
         role: role,
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
      tipeMentor: Map<String, bool>.from(json['tipeMentor']),
      riwayatBeasiswa: List<String>.from(json['riwayatBeasiswa']),
      keahlian: Map<String, bool>.from(json['keahlian']),
      mediaMentoring: Map<String, bool>.from(json['mediaMentoring']),
      dokumen: List<String>.from(json['dokumen']),
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
      tipeMentor: {},
      riwayatBeasiswa: [],
      keahlian: {},
      mediaMentoring: {},
      dokumen: [],
    );
  }

  @override
  bool isInitialized() {
    return super.isInitialized() &&
        tipeMentor.isNotEmpty &&
        riwayatBeasiswa.isNotEmpty &&
        keahlian.isNotEmpty &&
        mediaMentoring.isNotEmpty &&
        dokumen.isNotEmpty;
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
    Map<String, bool>? tipeMentor,
    List<String>? riwayatBeasiswa,
    Map<String, bool>? keahlian,
    Map<String, bool>? mediaMentoring,
    List<String>? dokumen,
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
    );
  }
}
>>>>>>> fbc2938bacd696fc3a3d3fec73c6b5fd6b41328f
