import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';

class StudentEntity extends UserEntity {
  StudentEntity({
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

  @override
  StudentEntity copyWith({
    String? role,
    String? pictureURL,
    String? username,
    String? fullname,
    String? pendidikan,
    String? programStudi,
    String? domisili,
    String? alamat,
    String? deskripsi,
  }) {
    return StudentEntity(
      role: role ?? this.role,
      pictureURL: pictureURL ?? this.pictureURL,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      pendidikan: pendidikan ?? this.pendidikan,
      programStudi: programStudi ?? this.programStudi,
      domisili: domisili ?? this.domisili,
      alamat: alamat ?? this.alamat,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }
}
