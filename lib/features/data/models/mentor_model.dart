import 'package:team10_dhiraga/features/data/models/auth_user_model.dart';
import 'package:team10_dhiraga/features/domain/entities/mentor_entity.dart';

class MentorModel extends MentorEntity {
  MentorModel({
    required super.role,
    required super.pictureURL,
    required super.username,
    required super.fullname,
    required super.pendidikan,
    required super.programStudi,
    required super.domisili,
    required super.alamat,
    required super.deskripsi,
    required super.tipeMentor,
    required super.beasiswa,
    required super.mediaMentoring,
    required super.keahlian,
    required super.berkasURL,
    required super.ketersediaanHari,
    required super.ketersediaanJamOnline,
    required super.ketersediaanJamOffline,
    required super.hargaOnline,
    required super.hargaOffline,
  });

  factory MentorModel.fromJson(Map<String, dynamic> json) {
    return MentorModel(
      role: json['role'],
      pictureURL: json['pictureURL'],
      username: json['username'],
      fullname: json['fullname'],
      pendidikan: json['pendidikan'],
      programStudi: json['programStudi'],
      domisili: json['domisili'],
      alamat: json['alamat'],
      deskripsi: json['deskripsi'],
      tipeMentor: Map<String, bool>.from(json['tipeMentor']),
      beasiswa: List<String>.from(json['beasiswa']),
      mediaMentoring: Map<String, bool>.from(json['mediaMentoring']),
      keahlian: (json['keahlian'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Map<String, bool>.from(value)),
      ),
      berkasURL: List<String>.from(json['berkasURL']),
      ketersediaanHari: Map<String, bool>.from(json['ketersediaanHari']),
      ketersediaanJamOnline: Map<String, bool>.from(
        json['ketersediaanJamOnline'],
      ),
      ketersediaanJamOffline: Map<String, bool>.from(
        json['ketersediaanJamOffline'],
      ),
      hargaOnline: (json['hargaOnline'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key.split(','), Map<String, int>.from(value)),
      ),
      hargaOffline: (json['hargaOffline'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key.split(','), Map<String, int>.from(value)),
      ),
    );
  }

  factory MentorModel.empty() {
    return MentorModel(
      role: "mentor",
      pictureURL: "",
      username: "",
      fullname: "",
      pendidikan: "",
      programStudi: "",
      domisili: "",
      alamat: "",
      deskripsi: "",
      tipeMentor: {"akademik": false, "beasiswa": false},
      beasiswa: [""],
      mediaMentoring: {"online": false, "offline": false},
      // TODO: make this better
      keahlian: {
        "keahlian": {"keahlian1": true},
      },
      berkasURL: [""],
      ketersediaanHari: {"senin": false},
      ketersediaanJamOnline: {"00.00-12.00": false},
      ketersediaanJamOffline: {"00.00-12.00": false},
      hargaOnline: {
        ["00.00-12.00"]: {"harga": 0},
      },
      hargaOffline: {
        ["00.00-12.00"]: {"harga": 0},
      },
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
      'tipeMentor': tipeMentor,
      'beasiswa': beasiswa,
      'mediaMentoring': mediaMentoring,
      'keahlian': keahlian.map((key, value) => MapEntry(key, value)),
      'berkasURL': berkasURL,
      'ketersediaanHari': ketersediaanHari,
      'ketersediaanJamOnline': ketersediaanJamOnline,
      'ketersediaanJamOffline': ketersediaanJamOffline,
      'hargaOnline': hargaOnline.map((key, value) => MapEntry(key, value)),
      'hargaOffline': hargaOffline.map((key, value) => MapEntry(key, value)),
    };
  }
}

class MentorUpdateParams extends UserUpdateParams {
  final String? pictureURL;
  final String? username;
  final String? fullname;
  final String? pendidikan;
  final String? programStudi;
  final String? domisili;
  final String? alamat;
  final String? deskripsi;
  final Map<String, bool>? tipeMentor;
  final List<String>? beasiswa;
  final Map<String, Map<String, bool>>? keahlian;
  final List<String>? berkasURL;
  final Map<String, bool>? mediaMentoring;
  final Map<String, bool>? ketersediaanHari;
  final Map<String, bool>? ketersediaanJamOnline;
  final Map<String, bool>? ketersediaanJamOffline;
  final Map<List<String>, Map<String, int>>? hargaOnline;
  final Map<List<String>, Map<String, int>>? hargaOffline;

  const MentorUpdateParams({
    this.pictureURL,
    this.username,
    this.fullname,
    this.pendidikan,
    this.programStudi,
    this.domisili,
    this.alamat,
    this.deskripsi,
    this.tipeMentor,
    this.beasiswa,
    this.keahlian,
    this.berkasURL,
    this.mediaMentoring,
    this.ketersediaanHari,
    this.ketersediaanJamOnline,
    this.ketersediaanJamOffline,
    this.hargaOnline,
    this.hargaOffline,
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
    if (tipeMentor != null) data['tipeMentor'] = tipeMentor;
    if (beasiswa != null) data['beasiswa'] = beasiswa;
    if (keahlian != null) data['keahlian'] = keahlian;
    if (berkasURL != null) data['berkasURL'] = berkasURL;
    if (mediaMentoring != null) data['mediaMentoring'] = mediaMentoring;
    if (ketersediaanHari != null) data['ketersediaanHari'] = ketersediaanHari;
    if (ketersediaanJamOnline != null) {
      data['ketersediaanJamOnline'] = ketersediaanJamOnline;
    }
    if (ketersediaanJamOffline != null) {
      data['ketersediaanJamOffline'] = ketersediaanJamOffline;
    }
    if (hargaOnline != null) data['hargaOnline'] = hargaOnline;
    if (hargaOffline != null) data['hargaOffline'] = hargaOffline;
    return data;
  }
}
