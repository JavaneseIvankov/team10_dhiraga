import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/features/data/models/beasiswa_model.dart';
import 'package:team10_dhiraga/features/data/models/mentor_model.dart';

List<MentorModel> filterMentorAndCombineResults(
  List<QuerySnapshot> results,
  List<List<String>> multiTags,
) {
  try {
    if (results.isEmpty) return [];

    Map<String, MentorModel> mentorMap = {};
    Map<String, int> mentorCount = {};

    for (QuerySnapshot snapshot in results) {
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          if (mentorMap.containsKey(doc.id)) {
            if (data['tags'] != null) {
              mentorMap[doc.id]!.tags.addAll(
                List<String>.from(data['tags'] ?? []),
              );
            }
          } else {
            try {
              mentorMap[doc.id] = MentorModel.fromJson(data);
            } catch (e) {
              throw Exception("Error parsing MentorModel from data: $e");
            }
          }

          mentorCount[doc.id] = (mentorCount[doc.id] ?? 0) + 1;
        } else {
          throw Exception("data is null for doc.id: ${doc.id}");
        }
      }
    }

    List<MentorModel> filteredMentors =
        mentorMap.entries
            .where((entry) => mentorCount[entry.key] == results.length)
            .map((entry) => entry.value)
            .where(
              (mentor) => multiTags.every(
                (tags) => tags.any((tag) => mentor.tags.contains(tag)),
              ),
            )
            .toList();

    return filteredMentors;
  } catch (e) {
    throw Exception('Error filtering and combining results: $e');
  }
}

List<BeasiswaModel> filterBeasiswaResults(
  List<QuerySnapshot> results,
  List<List<String>> multiTags,
) {
  try {
    if (results.isEmpty) return [];

    Map<String, BeasiswaModel> beasiswaMap = {};
    Map<String, int> beasiswaCount = {};

    for (QuerySnapshot snapshot in results) {
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>?;

        if (data != null) {
          if (beasiswaMap.containsKey(doc.id)) {
            if (data['tags'] != null && beasiswaMap[doc.id] is BeasiswaModel) {
              (beasiswaMap[doc.id] as BeasiswaModel).tags.addAll(
                List<String>.from(data['tags'] ?? []),
              );
            }
          } else {
            try {
              beasiswaMap[doc.id] = BeasiswaModel.fromJson(data);
            } catch (e) {
              throw Exception("Error parsing BeasiswaModel from data: $e");
            }
          }

          beasiswaCount[doc.id] = (beasiswaCount[doc.id] ?? 0) + 1;
        } else {
          throw Exception("data is null for doc.id: ${doc.id}");
        }
      }
    }

    List<BeasiswaModel> filteredBeasiswas =
        beasiswaMap.entries
            .where((entry) => beasiswaCount[entry.key] == results.length)
            .map((entry) => entry.value)
            .where(
              (model) => multiTags.every(
                (tags) => tags.any((tag) => model.tags.contains(tag)),
              ),
            )
            .toList();

    return filteredBeasiswas;
  } catch (e) {
    throw Exception('Error filtering and combining results: $e');
  }
}
