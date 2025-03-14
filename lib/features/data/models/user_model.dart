import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/data/models/student_model.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';

class UserModel extends UserEntity {
  UserModel({
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
    return {
      'username': username,
      'email': email,
      'profilePictureURL': profilePictureURL,
      'fullName': fullName,
      'pendidikan': pendidikan,
      'programStudi': programStudi,
      'domisili': domisili,
      'alamatLengkap': alamatLengkap,
      'deskripsi': deskripsi,
      'role': role,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    switch (json['role']) {
      case 'student':
        return StudentModel.fromJson(json);
      case 'mentor':
        return MentorModel.fromJson(json);
      default:
        return UserModel(
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
        );
    }
  }

  @override
  bool isInitialized() {
    return username.isNotEmpty &&
        email.isNotEmpty &&
        profilePictureURL.isNotEmpty &&
        fullName.isNotEmpty &&
        pendidikan.isNotEmpty &&
        programStudi.isNotEmpty &&
        role.isNotEmpty;
  }

  factory UserModel.empty(String role) {
    switch (role) {
      case 'student':
        return StudentModel.empty();
      case 'mentor':
        return MentorModel.empty();
      default:
        return UserModel(
          username: '',
          email: '',
          profilePictureURL: '',
          fullName: '',
          pendidikan: '',
          programStudi: '',
          domisili: '',
          alamatLengkap: '',
          deskripsi: '',
          role: role,
        );
    }
  }

  UserModel copyWith({
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
  }) {
    return UserModel(
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
    );
  }
}
