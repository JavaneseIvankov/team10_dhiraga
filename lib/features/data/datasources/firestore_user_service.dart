import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserService {
  final FirebaseFirestore _firestore;
  final _baseCollectionPath = '/users';

  FirestoreUserService({firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // createUser
  Future<void> createUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore
          .collection(_baseCollectionPath)
          .doc(data[userId])
          .set(data);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  // getUser(s)
  Future<UserModel> getUserById(String userId) async {
    try {
      var doc = await _firestore.collection(_baseCollectionPath).doc(userId).get();
      var model = UserModel.fromJson()
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }


  // updateUser
  // deleteUser
}


abstract class IJsonSerializable {
  T fromJson<T>();
  Map<String, dynamic> toJson();
}