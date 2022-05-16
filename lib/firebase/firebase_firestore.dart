import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_app/firebase/firebase_helper/app_error_code.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/models/user_model.dart';
import 'firebase_helper/app_collection.dart';

class FirebaseStore {
  static final FirebaseStore storeInstance = FirebaseStore._internal();
  FirebaseStore._internal();
  factory FirebaseStore() => storeInstance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<ResponseModel> insertUserData(UserModel user) async {
    try {
      await _store
          .collection(AppCollections.user)
          .doc(user.userId)
          .set(user.toMap());
      return ResponseModel(
        statusCode: AppErrorCode.success,
        statusMessage: AppErrorMessage.success,
        data: user,
      );
    } on FirebaseException catch (e) {
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

  Future<ResponseModel> fetchUserList() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _store.collection(AppCollections.user).get();
      List<UserModel> allData = querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data()))
          .toList();

      return ResponseModel(
        statusCode: AppErrorCode.success,
        statusMessage: AppErrorMessage.success,
        data: allData,
      );
    } on FirebaseException catch (e) {
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
