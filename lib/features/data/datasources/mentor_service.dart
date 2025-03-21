// A class for a user-specific CRUD operation
// More advanced functionalities like filter
// It uses compound (multi-values) queries based on tags field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/features/data/datasources/helpers.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';

class MentorService {
  final FirebaseFirestore _firestore;
  final _collectionPath = 'users';

  MentorService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _usersCollection =>
      _firestore.collection(_collectionPath);

  Future<List<MentorModel>> getMentorsByMultiTags({
    required List<List<String>?> multiTags,
    int? limit,
  }) async {
    if (multiTags.isEmpty) return await getAllMentors(limit);
    try {
      List<Future<QuerySnapshot>> futures =
          multiTags.map((tags) {
            return _usersCollection
                .where('role', isEqualTo: 'mentor')
                .where('tags', arrayContainsAny: tags)
                .limit(limit ?? 20)
                .get();
          }).toList();

      List<QuerySnapshot> results = await Future.wait(futures);

      return filterMentorAndCombineResults(
        results,
        multiTags as List<List<String>>,
      );
    } catch (e) {
      throw Exception('Error getting mentors by multi-tags: $e');
    }
  }

  Future<List<MentorModel>> getAllMentors(int? limit) async {
    try {
      final querySnapshot =
          await _usersCollection
              .where('role', isEqualTo: 'mentor')
              .limit(limit ?? 20)
              .get();
      return querySnapshot.docs
          .map(
            (doc) => MentorModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Error getting all mentors: $e');
    }
  }

  Future<List<MentorModel>> getMentorsByTags(List<String> tags) async {
    try {
      final querySnapshot =
          await _usersCollection
              .where('role', isEqualTo: 'mentor')
              .where('tags', arrayContainsAny: tags)
              .get();
      return querySnapshot.docs
          .map(
            (doc) => MentorModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Error getting mentors by tags: $e');
    }
  }

  Future<List<MentorModel>> getMentorsByField(
    String fieldName,
    dynamic value,
  ) async {
    try {
      final querySnapshot =
          await _usersCollection
              .where('role', isEqualTo: 'mentor')
              .where(fieldName, isEqualTo: value)
              .get();
      return querySnapshot.docs
          .map(
            (doc) => MentorModel.fromJson(doc.data() as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Error getting mentors by field: $e');
    }
  }

  Query getMentorsQuery() {
    return _usersCollection.where('role', isEqualTo: 'mentor');
  }
}
