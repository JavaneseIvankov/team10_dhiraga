import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team10_dhiraga/features/data/models/user_model.dart';

// A class for basic CRUD firestore-operation (role-agnostic)
class FirestoreUserService {
  final FirebaseFirestore _firestore;
  final _collectionPath = 'users';

  FirestoreUserService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _usersCollection =>
      _firestore.collection(_collectionPath);

  Future<UserModel?> createUser(String userId, String role) async {
    try {
      final user = UserModel.empty(role, userId);
      await _usersCollection.doc(userId).set(user.toJson());
      return user;
    } catch (e) {
      throw Exception('Error creating user: $e');
    }
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      final doc = await _usersCollection.doc(userId).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error getting user: $e');
    }
  }

  Future<void> updateUser(
    String userId,
    Map<String, dynamic> updateFields,
  ) async {
    try {
      await _usersCollection.doc(userId).update(updateFields);
    } catch (e) {
      throw Exception('Error updating user: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _usersCollection.doc(userId).delete();
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }
}
