// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentRequestModel _$DocumentRequestModelFromJson(
        Map<String, dynamic> json) =>
    DocumentRequestModel(
      requestId: json['requestId'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      addedBy: json['addedBy'] as String?,
      addedOn: json['addedOn'] as String?,
      actionBy: json['actionBy'] as String?,
    );

Map<String, dynamic> _$DocumentRequestModelToJson(
        DocumentRequestModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'type': instance.type,
      'description': instance.description,
      'status': instance.status,
      'addedOn': instance.addedOn,
      'addedBy': instance.addedBy,
      'actionBy': instance.actionBy,
    };
