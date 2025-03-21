import 'package:flutter/rendering.dart';
import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';
import 'package:team10_dhiraga/features/domain/entities/user_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/user_repository.dart';
import 'package:team10_dhiraga/features/data/constants/mentor_constants.dart';

class GetMentors implements UseCase<List<UserEntity>, GetMentorParams> {
  final UserRepository _userRepository;

  GetMentors(this._userRepository);

  @override
  Future<List<MentorModel>> call(GetMentorParams params) async {
    return _userRepository.getMentorWithQuery(
      query: params.toList(),
      limit: 20,
    );
  }
}

class GetMentorParams {
  // Media Mentoring
  bool offline;
  bool online;

  // Tipe Mentor
  bool akademik;
  bool beasiswa;

  // Rating
  bool minimalRating;

  // Ketersediaan Hari
  bool senin;
  bool selasa;
  bool rabu;
  bool kamis;
  bool jumat;
  bool sabtu;
  bool minggu;

  // Keahlian IT Developer
  bool productManager;
  bool backend;
  bool frontend;
  bool uiUx;

  // Keahlian Bahasa
  bool inggris;
  bool jerman;
  bool korea;
  bool jepang;

  // Mata Pelajaran
  bool biologi;
  bool fisika;
  bool kimia;
  bool matematika;
  bool sejarah;

  GetMentorParams({
    this.offline = false,
    this.online = false,
    this.akademik = false,
    this.beasiswa = false,
    this.minimalRating = false,
    this.senin = false,
    this.selasa = false,
    this.rabu = false,
    this.kamis = false,
    this.jumat = false,
    this.sabtu = false,
    this.minggu = false,
    this.productManager = false,
    this.backend = false,
    this.frontend = false,
    this.uiUx = false,
    this.inggris = false,
    this.jerman = false,
    this.korea = false,
    this.jepang = false,
    this.biologi = false,
    this.fisika = false,
    this.kimia = false,
    this.matematika = false,
    this.sejarah = false,
  });

  List<List<String>> toList() {
    var mediaMentoring = <String>[];
    var tipeMentor = <String>[];
    var hari = <String>[];
    var keahlian = <String>[];
    var bahasa = <String>[];
    var mataPelajaran = <String>[];

    if (offline) mediaMentoring.add(MentorTag.offline);
    if (online) mediaMentoring.add(MentorTag.online);
    if (minimalRating) mediaMentoring.add(MentorTag.minimumRating);

    if (akademik) tipeMentor.add('Akademik');
    if (beasiswa) tipeMentor.add('Beasiswa');

    if (senin) hari.add(MentorTag.senin);
    if (selasa) hari.add(MentorTag.selasa);
    if (rabu) hari.add(MentorTag.rabu);
    if (kamis) hari.add(MentorTag.kamis);
    if (jumat) hari.add(MentorTag.jumat);
    if (sabtu) hari.add(MentorTag.sabtu);
    if (minggu) hari.add('Minggu');

    if (productManager) keahlian.add(MentorTag.productManager);
    if (backend) keahlian.add(MentorTag.backEnd);
    if (frontend) keahlian.add(MentorTag.frontEnd);
    if (uiUx) keahlian.add(MentorTag.uiUx);

    if (inggris) bahasa.add(MentorTag.inggris);
    if (jerman) bahasa.add(MentorTag.jerman);
    if (korea) bahasa.add(MentorTag.korea);
    if (jepang) bahasa.add(MentorTag.jepang);

    if (biologi) mataPelajaran.add(MentorTag.biologi);
    if (fisika) mataPelajaran.add(MentorTag.fisika);
    if (kimia) mataPelajaran.add(MentorTag.kimia);
    if (matematika) mataPelajaran.add(MentorTag.matematika);
    if (sejarah) mataPelajaran.add(MentorTag.sejarah);

    List<List<String>> result = [];
    if (mediaMentoring.isNotEmpty) result.add(mediaMentoring);
    if (tipeMentor.isNotEmpty) result.add(tipeMentor);
    if (hari.isNotEmpty) result.add(hari);
    if (keahlian.isNotEmpty) result.add(keahlian);
    if (bahasa.isNotEmpty) result.add(bahasa);
    if (mataPelajaran.isNotEmpty) result.add(mataPelajaran);

    debugPrint(result.toString());

    return result;
  }
}
