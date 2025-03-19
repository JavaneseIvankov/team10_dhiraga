import 'package:team10_dhiraga/core/usecases/usecases.dart';
import 'package:team10_dhiraga/features/data/constants/beasiswa_constants.dart';
import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/beasiswa_repository.dart';

class GetBeasiswas implements UseCase<List<BeasiswaEntity>, GetBeasiswaParams> {
  final BeasiswaRepository _beasiswaRepository;

  GetBeasiswas(this._beasiswaRepository);

  @override
  Future<List<BeasiswaEntity>> call(GetBeasiswaParams params) async {
    return _beasiswaRepository.getBeasiswaWithQuery(
      query: params.toList(),
      sortQuery: _createSortQuery(params.deadlineTerdekat, params.palingDicari),
      limit: 20,
    );
  }
}

List<List<String>> _createSortQuery(bool deadlineTerdekat, bool palingDicari) {
  List<List<String>> result = [];
  if (deadlineTerdekat) result.add(BeasiswaSortConstants.deadlineTerdekat);
  if (palingDicari) result.add(BeasiswaSortConstants.palingDicari);
  return result;
}

class GetBeasiswaParams {
  bool deadlineTerdekat;
  bool palingDicari;

  // Jenjang
  bool s1;
  bool s2;
  bool s3;
  bool s4;
  bool s5;
  bool d4;
  bool d3;
  bool sma;

  // Benefit
  bool fullyFunded;
  bool partial;

  // Ketentuan
  bool minimumIPK;
  bool semester1;
  bool semester2;
  bool semester3;
  bool semester4;
  bool semester5;
  bool lebihSemester6;

  GetBeasiswaParams({
    this.deadlineTerdekat = false,
    this.palingDicari = false,
    this.s1 = false,
    this.s2 = false,
    this.s3 = false,
    this.s4 = false,
    this.s5 = false,
    this.d4 = false,
    this.d3 = false,
    this.sma = false,
    this.fullyFunded = false,
    this.partial = false,
    this.minimumIPK = false,
    this.semester1 = false,
    this.semester2 = false,
    this.semester3 = false,
    this.semester4 = false,
    this.semester5 = false,
    this.lebihSemester6 = false,
  });

  List<List<String>> toList() {
    var jenjang = <String>[];
    var benefit = <String>[];
    var ketentuan = <String>[];

    if (s1) jenjang.add(BeasiswaTag.s1);
    if (s2) jenjang.add(BeasiswaTag.s2);
    if (s3) jenjang.add(BeasiswaTag.s3);
    if (d4) jenjang.add(BeasiswaTag.d4);
    if (d3) jenjang.add(BeasiswaTag.d3);
    if (sma) jenjang.add(BeasiswaTag.sma);

    if (fullyFunded) benefit.add(BeasiswaTag.fullyFunded);
    if (partial) benefit.add(BeasiswaTag.partiallyFunded);

    if (minimumIPK) ketentuan.add(BeasiswaTag.denganMinimumIPK);
    if (semester1) ketentuan.add(BeasiswaTag.semester1);
    if (semester2) ketentuan.add(BeasiswaTag.semester2);
    if (semester3) ketentuan.add(BeasiswaTag.semester3);
    if (semester4) ketentuan.add(BeasiswaTag.semester4);
    if (semester5) ketentuan.add(BeasiswaTag.semester5);
    if (lebihSemester6) ketentuan.add(BeasiswaTag.semester6);

    return [jenjang, benefit, ketentuan];
  }
}
