import 'package:team10_dhiraga/features/data/models/user_model.dart';

class StudentModel extends UserModel {
  final List<String> bookmark;

  StudentModel({
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
    required this.bookmark,
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
         role: role,
       );

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['bookmark'] = bookmark;
    return map;
  }

  factory StudentModel.empty() {
    return StudentModel(
      username: '',
      email: '',
      profilePictureURL: '',
      fullName: '',
      pendidikan: '',
      programStudi: '',
      domisili: '',
      alamatLengkap: '',
      deskripsi: '',
      role: 'student',
      bookmark: [],
    );
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
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
      bookmark: List<String>.from(json['bookmark']),
    );
  }

  @override
  bool isInitialized() {
    return super.isInitialized();
  }

  @override
  StudentModel copyWith({
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
    List<String>? bookmark,
  }) {
    return StudentModel(
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
      bookmark: bookmark ?? this.bookmark,
    );
  }
}
