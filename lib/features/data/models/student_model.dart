import 'package:team10_dhiraga/features/data/models/auth_user_model.dart';
import 'package:team10_dhiraga/features/domain/entities/student_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    required super.role,
    required super.pictureURL,
    required super.username,
    required super.fullname,
    required super.pendidikan,
    required super.programStudi,
    required super.domisili,
    required super.alamat,
    required super.deskripsi,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      role: json['role'],
      pictureURL: json['pictureURL'],
      username: json['username'],
      fullname: json['fullname'],
      pendidikan: json['pendidikan'],
      programStudi: json['programStudi'],
      domisili: json['domisili'],
      alamat: json['alamat'],
      deskripsi: json['deskripsi'],
    );
  }

  factory StudentModel.empty() {
    return StudentModel(
      role: "student",
      pictureURL: "",
      username: "",
      fullname: "",
      pendidikan: "",
      programStudi: "",
      domisili: "",
      alamat: "",
      deskripsi: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'pictureURL': pictureURL,
      'username': username,
      'fullname': fullname,
      'pendidikan': pendidikan,
      'programStudi': programStudi,
      'domisili': domisili,
      'alamat': alamat,
      'deskripsi': deskripsi,
    };
  }
}

class StudentUpdateParams extends UserUpdateParams {
  final String? pictureURL;
  final String? username;
  final String? fullname;
  final String? pendidikan;
  final String? programStudi;
  final String? domisili;
  final String? alamat;
  final String? deskripsi;

  const StudentUpdateParams({
    this.pictureURL,
    this.username,
    this.fullname,
    this.pendidikan,
    this.programStudi,
    this.domisili,
    this.alamat,
    this.deskripsi,
  });

  @override
  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    if (pictureURL != null) data['pictureURL'] = pictureURL;
    if (username != null) data['username'] = username;
    if (fullname != null) data['fullname'] = fullname;
    if (pendidikan != null) data['pendidikan'] = pendidikan;
    if (programStudi != null) data['programStudi'] = programStudi;
    if (domisili != null) data['domisili'] = domisili;
    if (alamat != null) data['alamat'] = alamat;
    if (deskripsi != null) data['deskripsi'] = deskripsi;
    return data;
  }
}
