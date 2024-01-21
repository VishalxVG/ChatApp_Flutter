import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timestamp;

  Message(
    this.senderId,
    this.senderEmail,
    this.receiverID,
    this.message,
    this.timestamp,
  );

  // convert to a map

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderId,
      'senderEmail': receiverID,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp
    };
  }
}
