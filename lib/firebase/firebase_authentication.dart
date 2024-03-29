import 'package:counter_app/firebase/firebase_firestore.dart';
import 'package:counter_app/helpers/global.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_helper/app_error_code.dart';

class FirebaseAuthentication {
  static final FirebaseAuthentication authInstance =
      FirebaseAuthentication._internal();
  FirebaseAuthentication._internal();
  factory FirebaseAuthentication() => authInstance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStore _store = FirebaseStore.storeInstance;

  Future<ResponseModel> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      return ResponseModel(
        statusCode: AppErrorCode.success,
        statusMessage: AppErrorMessage.success,
      );
    } catch (e) {
      return ResponseModel(
        statusCode: AppErrorCode.failed,
        statusMessage: e.toString(),
      );
    }
  }

  UserModel? get currentUser {
    User? user = _auth.currentUser;
    if (user != null) {
      UserModel userModel = UserModel(
        email: user.email ?? '',
        name: user.displayName ?? '',
        userId: user.uid,
        profileImage: user.photoURL ?? '',
        phoneMumber: user.phoneNumber ?? '',
      );
      return userModel;
    } else {
      return null;
    }
  }

  initializeFirebaseAuth() async {
    await _auth.useAuthEmulator('localhost', 9099);
  }

  Future<ResponseModel> googleSignIn() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        return _userAuthentication(credential);
      }
      return ResponseModel(
        statusCode: AppErrorCode.noData,
        statusMessage: AppErrorMessage.noData,
      );
    } on FirebaseAuthException catch (e) {
      return ResponseModel(
        statusCode: AppErrorCode.failed,
        statusMessage: e.toString(),
      );
    }
  }

  Future<ResponseModel> _userAuthentication(AuthCredential credential) async {
    printDebug(credential);
    // Once signed in, return the UserCredential
    try {
      UserCredential userCred = await _auth.signInWithCredential(credential);
      User? user = userCred.user;

      if (user != null) {
        ResponseModel responseModel = await _store.insertUserData(
          UserModel(
            email: user.email ?? '',
            name: user.displayName ?? '',
            userId: user.uid,
            profileImage: user.photoURL ?? '',
            phoneMumber: user.phoneNumber ?? '',
          ),
        );
        return responseModel;
      }
      return ResponseModel(
        statusCode: AppErrorCode.noData,
        statusMessage: AppErrorMessage.noData,
      );
    } on FirebaseAuthException catch (e) {
      return ResponseModel(
        statusCode: e.code,
        statusMessage: e.message ?? AppErrorMessage.error,
      );
    } catch (e) {
      return ResponseModel(
        statusCode: AppErrorCode.failed,
        statusMessage: e.toString(),
      );
    }
  }
}
