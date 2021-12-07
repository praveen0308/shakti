// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRequestModel _$ServiceRequestModelFromJson(Map<String, dynamic> json) =>
    ServiceRequestModel(
      requestId: json['requestId'] as String?,
      type: json['type'] as String?,
      areaName: json['areaName'] as String?,
      landmark: json['landmark'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      status: json['status'] as String?,
      addedOn: json['addedOn'] as String?,
      addedBy: json['addedBy'] as String?,
      actionBy: json['actionBy'] as String?,
    );

Map<String, dynamic> _$ServiceRequestModelToJson(
        ServiceRequestModel instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'type': instance.type,
      'areaName': instance.areaName,
      'landmark': instance.landmark,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'images': instance.images,
      'description': instance.description,
      'status': instance.status,
      'addedOn': instance.addedOn,
      'addedBy': instance.addedBy,
      'actionBy': instance.actionBy,
    };
