abstract class UserEntity {
  final String username;
  final String email;
  final String profilePictureURL;
  final String fullName;
  final String pendidikan;
  final String programStudi;
  final String domisili;
  final String alamatLengkap;
  final String deskripsi;

  UserEntity({
    required this.username,
    required this.email,
    required this.profilePictureURL,
    required this.fullName,
    required this.pendidikan,
    required this.programStudi,
    required this.domisili,
    required this.alamatLengkap,
    required this.deskripsi,
  });

  Map<String, dynamic> toJson();

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() must be implemented in subclasses');
  }
}
