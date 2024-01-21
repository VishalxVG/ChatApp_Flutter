// ignore_for_file: non_constant_identifier_names

import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  // get instance of firestore and auth

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> sendMessages(String receiverID, message) async {
    //* ger current user info

    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    //* create a new message

    Message newMessage = Message(
      currentUserEmail,
      currentUserID,
      receiverID,
      message,
      timestamp,
    );

    //* construct chat room ID for two users (sorted to ensure uniqueness)

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join("_");

    //* add new messages to database

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get messages

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    // construct a chat id for 2 users

    List<String> ids = [userID, otherUserID];
    ids.sort();
    String ChatRoomId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(ChatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
