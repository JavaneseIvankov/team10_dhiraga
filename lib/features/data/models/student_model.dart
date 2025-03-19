import 'package:team10_dhiraga/features/data/models/user_model.dart';

class StudentModel extends UserModel {
  final List<String> bookmark;

  StudentModel({
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
    required this.bookmark,
  }) : super(role: 'student');

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['bookmark'] = bookmark;
    return map;
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
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
      bookmark: List<String>.from(json['bookmark']),
    );
  }

  factory StudentModel.empty(String? id) {
    return StudentModel(
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
      bookmark: [],
    );
  }

  @override
  bool isInitialized() {
    return super.isInitialized();
  }

  @override
  StudentModel copyWith({
    String? id,
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
      id: this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      fullName: fullName ?? this.fullName,
      pendidikan: pendidikan ?? this.pendidikan,
      programStudi: programStudi ?? this.programStudi,
      domisili: domisili ?? this.domisili,
      alamatLengkap: alamatLengkap ?? this.alamatLengkap,
      deskripsi: deskripsi ?? this.deskripsi,
      bookmark: bookmark ?? this.bookmark,
    );
  }
}
