import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  String? serviceId;
  String? no;
  String? name;
  String? imgUrl;

  ServiceModel({this.serviceId, this.no, this.name, this.imgUrl});
  factory ServiceModel.fromSnapshot(QueryDocumentSnapshot snapshot) =>
      ServiceModel(
        serviceId: snapshot.id,
        no: snapshot['no'] as String?,
        name: snapshot['option'] as String?,
        imgUrl: snapshot['imgUrl'] as String?,
      );
  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
