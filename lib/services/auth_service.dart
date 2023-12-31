import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/helpers/export_helpers.dart';
import 'package:quiz_go/models/export_models.dart';

class AuthService {
  AuthService({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  /// Returns [UseModel] object on success and [AppError] on failure
  FutureAppEither<UserModel> signUp(
    String email,
    String password,
    String userName,
  ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      if (user == null) {
        throw 'Something went wrong!!!';
      }
      final userModel = UserModel(email: email, userName: userName);
      return right(userModel);
    } on FirebaseAuthException catch (error) {
      final messaage = FirebaseHelper.getMessageFromErrorCode(error);
      return left(AppError(message: messaage));
    } catch (e) {
      log('Error Message in SignUp : $e');
      return left(AppError(message: e.toString()));
    }
  }

  FutureAppEither<String> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      if (user == null) {
        throw 'Something went wrong!!!';
      }

      return right(user.uid);
    } on FirebaseAuthException catch (error) {
      final messaage = FirebaseHelper.getMessageFromErrorCode(error);
      return left(AppError(message: messaage));
    } catch (e) {
      log('Error Message in SignUp : $e');
      return left(AppError(message: e.toString()));
    }
  }

  FutureAppEither<bool> signOut() async {
    try {
      await _auth.signOut();
      return right(true);
    } on FirebaseAuthException catch (error) {
      final messaage = FirebaseHelper.getMessageFromErrorCode(error);
      return left(AppError(message: messaage));
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
