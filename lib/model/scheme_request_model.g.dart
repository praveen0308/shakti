// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheme_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemeRequestModel _$SchemeRequestModelFromJson(Map<String, dynamic> json) =>
    SchemeRequestModel(
      requestId: json['requestId'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      addedBy: json['addedBy'] as String?,
      addedOn: json['addedOn'] as String?,
      actionBy: json['actionBy'] as String?,
    );

Map<String, dynamic> _$SchemeRequestModelToJson(SchemeRequestModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'type': instance.type,
      'description': instance.description,
      'status': instance.status,
      'addedOn': instance.addedOn,
      'addedBy': instance.addedBy,
      'actionBy': instance.actionBy,
    };
