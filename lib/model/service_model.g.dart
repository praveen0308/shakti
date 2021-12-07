// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      serviceId: json['serviceId'] as String?,
      no: json['no'] as String?,
      name: json['name'] as String?,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'no': instance.no,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
    };
