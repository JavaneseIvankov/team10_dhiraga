import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/features/data/datasources/helpers.dart';
import 'package:team10_dhiraga/features/data/models/beasiswa_model.dart';

class BeasiswaService {
  final FirebaseFirestore _firestore;
  final _collectionPath = 'beasiswa';

  BeasiswaService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _beasiswaCollection =>
      _firestore.collection(_collectionPath);

  // Future<BeasiswaModel?> createBeasiswa(BeasiswaModel beasiswa) async {
  //   try {
  //     await _beasiswaCollection.doc(beasiswa.id).set(beasiswa.toJson());
  //     return beasiswa;
  //   } catch (e) {
  //     throw Exception('Error creating beasiswa: $e');
  //   }
  // }

  Future<BeasiswaModel?> getBeasiswa(String beasiswaId) async {
    try {
      final doc = await _beasiswaCollection.doc(beasiswaId).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return BeasiswaModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error getting beasiswa: $e');
    }
  }

  // Future<void> updateBeasiswa(
  //   String beasiswaId,
  //   Map<String, dynamic> updateFields,
  // ) async {
  //   try {
  //     await _beasiswaCollection.doc(beasiswaId).update(updateFields);
  //   } catch (e) {
  //     throw Exception('Error updating beasiswa: $e');
  //   }
  // }

  // Future<void> deleteBeasiswa(String beasiswaId) async {
  //   try {
  //     await _beasiswaCollection.doc(beasiswaId).delete();
  //   } catch (e) {
  //     throw Exception('Error deleting beasiswa: $e');
  //   }
  // }

  Future<List<BeasiswaModel>> getBeasiswaByMultitags({
    required List<List<String>> multiTags,
    List<List<String>>? sortQuery,
    int? limit,
  }) async {
    try {
      List<Future<QuerySnapshot>> futures =
          multiTags.map((tags) {
            var query = _beasiswaCollection.where(
              'tags',
              arrayContainsAny: tags,
            );
            if (limit != null) query = query.limit(limit);
            if (sortQuery != null) {
              for (var sort in sortQuery) {
                query = query.orderBy(sort[0], descending: sort[1] == 'desc');
              }
            }
            return query.get();
          }).toList();

      List<QuerySnapshot> results = await Future.wait(futures);

      return filterBeasiswaResults(results, multiTags);
    } catch (e) {
      throw Exception('Error getting beasiswa by multi-tags: $e');
    }
  }

  Future<List<BeasiswaModel>> getAllBeasiswa() async {
    try {
      final querySnapshot = await _beasiswaCollection.get();
      return querySnapshot.docs
          .map(
            (doc) => BeasiswaModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Error getting all beasiswa: $e');
    }
  }
}
