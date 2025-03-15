import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';

class StudentEntity extends UserEntity {
  final String pictureURL;
  final String alamat;

  StudentEntity({
    required String id,
    required String email,
    required String username,
    required String fullName,
    required String pendidikan,
    required String programStudi,
    required String domisili,
    required String deskripsi,
    required String profilePictureURL,
    required String alamatLengkap,
    required String role,
    required this.pictureURL,
    required this.alamat,
  }) : super(
         id: id,
         email: email,
         username: username,
         fullName: fullName,
         pendidikan: pendidikan,
         programStudi: programStudi,
         domisili: domisili,
         deskripsi: deskripsi,
         profilePictureURL: profilePictureURL,
         alamatLengkap: alamatLengkap,
         role: role,
       );

  @override
  StudentEntity copyWith({
    String? pictureURL,
    String? alamat,
    String? username,
    String? fullName,
    String? pendidikan,
    String? programStudi,
    String? domisili,
    String? deskripsi,
    String? profilePictureURL,
    String? alamatLengkap,
    String? role,
  }) {
    return StudentEntity(
      id: id,
      email: email,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      pendidikan: pendidikan ?? this.pendidikan,
      programStudi: programStudi ?? this.programStudi,
      domisili: domisili ?? this.domisili,
      deskripsi: deskripsi ?? this.deskripsi,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      alamatLengkap: alamatLengkap ?? this.alamatLengkap,
      role: role ?? this.role,
      pictureURL: pictureURL ?? this.pictureURL,
      alamat: alamat ?? this.alamat,
    );
  }

  @override
  bool isInitialized() {
    return id.isNotEmpty && email.isNotEmpty;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'fullName': fullName,
      'pendidikan': pendidikan,
      'programStudi': programStudi,
      'domisili': domisili,
      'deskripsi': deskripsi,
      'profilePictureURL': profilePictureURL,
      'alamatLengkap': alamatLengkap,
      'role': role,
      'pictureURL': pictureURL,
      'alamat': alamat,
    };
  }
}
