// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNo: json['mobileNo'] as String?,
      fcmToken: json['fcmToken'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'fcmToken': instance.fcmToken,
      'status': instance.status,
    };
