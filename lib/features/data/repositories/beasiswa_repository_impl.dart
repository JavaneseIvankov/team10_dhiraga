import 'package:team10_dhiraga/features/data/datasources/beasiswa_service.dart';
import 'package:team10_dhiraga/features/domain/entities/beasiswa_entity.dart';
import 'package:team10_dhiraga/features/domain/repositories/beasiswa_repository.dart';

class BeasiswaRepositoryImpl implements BeasiswaRepository {
  final BeasiswaService _beasiswaService;

  BeasiswaRepositoryImpl(this._beasiswaService);

  @override
  Future<BeasiswaEntity?> getBeasiswaById(String id) async {
    return await _beasiswaService.getBeasiswa(id);
  }

  @override
  Future<List<BeasiswaEntity>> getBeasiswaWithQuery({
    required List<List<String>> query,
    List<List<String>>? sortQuery,
    int? limit,
  }) async {
    return await _beasiswaService.getBeasiswaByMultitags(
      multiTags: query,
      sortQuery: sortQuery,
      limit: limit,
    );
  }
}
