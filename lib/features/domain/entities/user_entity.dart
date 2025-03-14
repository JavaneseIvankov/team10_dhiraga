abstract class UserEntity {
  final String id;
  final String username;
  final String email;
  final String profilePictureURL;
  final String fullName;
  final String pendidikan;
  final String programStudi;
  final String domisili;
  final String alamatLengkap;
  final String deskripsi;
  final String role;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePictureURL,
    required this.fullName,
    required this.pendidikan,
    required this.programStudi,
    required this.domisili,
    required this.alamatLengkap,
    required this.deskripsi,
    required this.role,
  });

  Map<String, dynamic> toJson();

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() must be implemented in subclasses');
  }

  factory UserEntity.empty() {
    throw UnimplementedError('empty() must be implemented in subclasses');
  }

  bool isInitialized();
}
