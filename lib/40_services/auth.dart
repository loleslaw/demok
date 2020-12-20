
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demok/00_models/user_model.dart';
import 'package:demok/90_helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      print(user);
      return user;
    } catch (error) {
        zShowMessage(
          title: 'Błąd połączenia', 
          message: 'Wystąpił problem z połączeniem z bazą danych ${error.toString()}',
          messageType: MessageType.ERROR
          );
      return null;
    }
  }

    //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser(String userId) {
    return _db.doc('/users/$userId').get().then(
          (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()));
  }
    void updateUserFirestore(UserModel user) {
    _db.doc('/users/${user.uid}').update(user.toJson());
  }

  //create the firestore user in users collection
  void createUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('/users/${_firebaseUser.uid}').set(user.toJson());
  }



}