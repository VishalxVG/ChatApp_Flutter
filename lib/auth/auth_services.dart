import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  // instance of auth

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // signin

  Future<UserCredential> signInWithEmailPassword(String email , password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password,);
    }
  }

  // sign up

  // sign out

  // errors
}
