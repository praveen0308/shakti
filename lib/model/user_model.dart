import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? userId;
  String? name;
  String? email;
  String? mobileNo;
  String? fcmToken;
  String? status;

  UserModel(
      {this.userId,
      this.name,
      this.email,
      this.mobileNo,
      this.fcmToken,
      this.status});

  factory UserModel.fromSnapshot(QueryDocumentSnapshot snapshot) => UserModel(
        userId: snapshot.id,
        name: snapshot['name'] as String?,
        email: snapshot['email'] as String?,
        mobileNo: snapshot['mobileNo'] as String?,
        fcmToken: snapshot['fcmToken'] as String?,
        status: snapshot['status'] as String?,
      );

  factory UserModel.fromDSnapshot(DocumentSnapshot snapshot) => UserModel(
        userId: snapshot.id,
        name: snapshot['name'] as String?,
        email: snapshot['email'] as String?,
        mobileNo: snapshot['mobileNo'] as String?,
        fcmToken: snapshot['fcmToken'] as String?,
        status: snapshot['status'] as String?,
      );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
