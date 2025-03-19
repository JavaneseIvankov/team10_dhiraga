import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';

abstract class BeasiswaRepository {
  Future<BeasiswaEntity?> getBeasiswaById(String userId);
  Future<List<BeasiswaEntity>> getBeasiswaWithQuery({
    required List<List<String>> query,
    List<List<String>>? sortQuery,
    int? limit,
  });
}
