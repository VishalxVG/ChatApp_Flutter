import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  // get instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((docs) {
        // go through each indivisual user
        final user = docs.data();

        // return user
        return user;
      }).toList();
    });
  }

  // send messages

  // get messages
}
