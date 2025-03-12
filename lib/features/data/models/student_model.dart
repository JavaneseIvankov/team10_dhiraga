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
       );

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['bookmark'] = bookmark;
    return map;
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
      bookmark: List<String>.from(json['bookmark']),
    );
  }
}
