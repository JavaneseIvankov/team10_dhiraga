import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/features/data/models/beasiswa_model.dart';

class FirestoreBeasiswaService {
  final FirebaseFirestore _firestore;
  final _collectionPath = 'beasiswa';

  FirestoreBeasiswaService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _beasiswaCollection =>
      _firestore.collection(_collectionPath);

  Future<BeasiswaModel?> getBeasiswaById(String id) async {
    try {
      final doc = await _beasiswaCollection.doc(id).get();
      if (doc.exists) {
        return BeasiswaModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error getting beasiswa by id: $e');
    }
  }

  Future<List<BeasiswaModel>> getBeasiswaByMultiTags(
    List<List<String>> multiTags,
  ) async {
    try {
      // Create a list of futures for each query
      List<Future<QuerySnapshot>> futures =
          multiTags.map((tags) {
            return _beasiswaCollection
                .where('tags', arrayContainsAny: tags)
                .get();
          }).toList();

      // Wait for all queries to complete
      List<QuerySnapshot> results = await Future.wait(futures);

      // Extracted logic
      return _filterAndCombineResults(results, multiTags);
    } catch (e) {
      throw Exception('Error getting beasiswa by multi-tags: $e');
    }
  }

  List<BeasiswaModel> _filterAndCombineResults(
    List<QuerySnapshot> results,
    List<List<String>> multiTags,
  ) {
    // Combine results and filter beasiswa that exist in all results
    Map<String, BeasiswaModel> beasiswaMap = {};
    for (QuerySnapshot snapshot in results) {
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        if (beasiswaMap.containsKey(doc.id)) {
          beasiswaMap[doc.id]!.tags.addAll(
            (doc.data() as Map<String, dynamic>)['tags'],
          );
        } else {
          beasiswaMap[doc.id] = BeasiswaModel.fromJson(
            doc.data() as Map<String, dynamic>,
          );
        }
      }
    }

    List<BeasiswaModel> filteredBeasiswa =
        beasiswaMap.values.where((beasiswa) {
          return multiTags.every(
            (tags) => tags.any((tag) => beasiswa.tags.contains(tag)),
          );
        }).toList();

    return filteredBeasiswa;
  }

  Future<List<BeasiswaModel>> getBeasiswaByTags(List<String> tags) async {
    try {
      final querySnapshot =
          await _beasiswaCollection.where('tags', arrayContainsAny: tags).get();
      return querySnapshot.docs
          .map(
            (doc) => BeasiswaModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Error getting beasiswa by tags: $e');
    }
  }

  Future<List<BeasiswaModel>> getBeasiswaByField(
    String fieldName,
    dynamic value,
  ) async {
    try {
      final querySnapshot =
          await _beasiswaCollection.where(fieldName, isEqualTo: value).get();
      return querySnapshot.docs
          .map(
            (doc) => BeasiswaModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Error getting beasiswa by field: $e');
    }
  }
}
