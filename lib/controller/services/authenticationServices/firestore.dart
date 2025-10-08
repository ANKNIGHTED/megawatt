import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Save an order document using a prepared payload. Adds server timestamp.
  Future<void> saveOrderToDatabase(Map<String, dynamic> orderPayload) async {
    final doc = _db.collection('orders').doc();
    final payloadWithTimestamp = {
      ...orderPayload,
      'createdAt': FieldValue.serverTimestamp(),
    };
    await doc.set(payloadWithTimestamp);
  }

  /// Upload photo to Firebase Storage
  Future<String> uploadProfilePicture(String userId, String filePath) async {
    final file = File(filePath);

    final storageRef = _storage.ref().child(
      'user_profiles/$userId/profile.jpg',
    );
    final uploadTask = storageRef.putFile(file);

    final snapshot = await uploadTask.whenComplete(() => {});
    final photoUrl = await snapshot.ref.getDownloadURL();

    await _db.collection('users').doc(userId).update({
      'profilePictureUrl': photoUrl,
    });

    return photoUrl;
  }

  /// Stream of orders for a given user id (most recent first).
  Stream<QuerySnapshot<Map<String, dynamic>>> ordersForUserStream(
    String userId,
  ) {
    return _db
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  /// Save a primary card metadata for a user (DO NOT STORE CVV).
  Future<void> saveCardForUser(
    String userId,
    Map<String, dynamic> cardData,
  ) async {
    final doc = _db
        .collection('users')
        .doc(userId)
        .collection('paymentMethods')
        .doc('primary');
    final payload = {...cardData, 'updatedAt': FieldValue.serverTimestamp()};
    await doc.set(payload);
  }

  /// Retrieve saved primary card metadata for a user.
  Future<Map<String, dynamic>?> getCardForUser(String userId) async {
    final doc =
        await _db
            .collection('users')
            .doc(userId)
            .collection('paymentMethods')
            .doc('primary')
            .get();
    if (!doc.exists) return null;
    return doc.data();
  }
}
