import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shakti/model/document_request_model.dart';
import 'package:shakti/model/scheme_request_model.dart';
import 'package:shakti/model/service_model.dart';
import 'package:shakti/model/service_request_model.dart';
import 'package:shakti/model/user_model.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _userReference = _fireStore.collection('user');
final CollectionReference _schemeRequestsReference =
    _fireStore.collection('scheme_requests');
final CollectionReference _serviceRequestsReference =
    _fireStore.collection('service_requests');
final CollectionReference _documentRequestsReference =
    _fireStore.collection('document_requests');

class UserRepository {
  static Future<UserModel?> checkUserExists(String uid) async {
    try {
      var user;
      var response1 = await _userReference.doc(uid).get();

      print("response >> $user");
      return user as UserModel;
    } catch (e) {
      return null;
    }
  }

  static Future<void> addNewUserDetail(UserModel userModel) async {
    await _documentRequestsReference
        .doc(userModel.userId)
        .set(userModel.toJson())
        .whenComplete(() => print("Registered successfully!!!"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> getUserNotifications(String userId) {
    return _userReference.doc(userId).collection("notifications").snapshots();
  }
}
