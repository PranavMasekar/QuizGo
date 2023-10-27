import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quiz_go/constants/export_constants.dart';

class AuthService {
  AuthService({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  /// Returns [UseModel] object on success and [AppError] on failure
  FutureAppEither<String> signUp(
    String userName,
    String password,
  ) async {
    try {
      CollectionReference shaUserCollection = _firestore.collection('SHA');
      var bytes = utf8.encode(password);
      var digest = sha1.convert(bytes);

      await shaUserCollection.add({
        'userName': userName,
        'password': digest.toString(),
      });

      return right(digest.toString());
    } catch (e) {
      log('Error Message in SignUp : $e');
      return left(AppError(message: e.toString()));
    }
  }

  FutureAppEither<String> login(String userName, String password) async {
    try {
      QuerySnapshot shaUsers = await _firestore.collection('SHA').get();

      List<Map<String, dynamic>> userDataList = [];

      for (var doc in shaUsers.docs) {
        userDataList.add(doc.data() as Map<String, dynamic>);
      }

      final user = userDataList.firstWhere(
        (element) => element['userName'] == userName,
        orElse: () => throw 'User not found',
      );

      var bytes = utf8.encode(password);
      var digest = sha1.convert(bytes);

      if (user['password'] != digest.toString()) {
        throw 'Invalid password';
      }

      return right(user['password']);
    } catch (e) {
      log('Error Message in SignUp : $e');
      return left(AppError(message: e.toString()));
    }
  }

  FutureAppEither<String> resetPassword(
    String username,
    String password,
  ) async {
    try {
      CollectionReference shaUserCollection = _firestore.collection('SHA');
      QuerySnapshot querySnapshot =
          await shaUserCollection.where('userName', isEqualTo: username).get();

      var bytes = utf8.encode(password);
      var digest = sha1.convert(bytes);

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        await shaUserCollection.doc(doc.id).update(
          {'password': digest.toString()},
        );
      } else {
        throw 'User not found';
      }

      return right(digest.toString());
    } catch (e) {
      log('Error Message in SignUp : $e');
      return left(AppError(message: e.toString()));
    }
  }

  FutureAppEither<bool> signOut() async {
    try {
      await _auth.signOut();
      return right(true);
    } catch (error) {
      log('Error Message in signOut : $error');
      return left(AppError(message: 'Something went wrong'));
    }
  }

  /// Returns [bool] object on success and [AppError] on failure
  FutureAppEither<bool> saveToFirestore(Map<String, dynamic> data) async {
    try {
      final uid = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(uid).set(data);
      return right(true);
    } catch (error) {
      log('Error Message in saveToFirestore : $error');
      return left(
        AppError(message: 'Failured in updating user'),
      );
    }
  }
}
