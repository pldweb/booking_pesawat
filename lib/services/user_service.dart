// ignore_for_file: prefer_final_fields, use_rethrow_when_possible

import 'package:booking_pesawat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }
}