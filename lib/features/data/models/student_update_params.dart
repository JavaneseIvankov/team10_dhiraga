class StudentUpdateParams {
  final String? username;
  final String? email;
  final String? profilePictureURL;
  final String? fullName;
  final String? pendidikan;
  final String? programStudi;
  final String? domisili;
  final String? alamatLengkap;
  final String? deskripsi;
  final List<String>? bookmark;

  StudentUpdateParams({
    this.username,
    this.email,
    this.profilePictureURL,
    this.fullName,
    this.pendidikan,
    this.programStudi,
    this.domisili,
    this.alamatLengkap,
    this.deskripsi,
    this.bookmark,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (username != null) data['username'] = username;
    if (email != null) data['email'] = email;
    if (profilePictureURL != null) {
      data['profilePictureURL'] = profilePictureURL;
    }
    if (fullName != null) data['fullName'] = fullName;
    if (pendidikan != null) data['pendidikan'] = pendidikan;
    if (programStudi != null) data['programStudi'] = programStudi;
    if (domisili != null) data['domisili'] = domisili;
    if (alamatLengkap != null) data['alamatLengkap'] = alamatLengkap;
    if (deskripsi != null) data['deskripsi'] = deskripsi;
    if (bookmark != null) data['bookmark'] = bookmark;
    return data;
  }
}
