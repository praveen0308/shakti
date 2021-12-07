import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shakti/model/query_model.dart';
part 'service_request_model.g.dart';

@JsonSerializable()
class ServiceRequestModel {
  String? requestId;
  String? type;
  String? areaName;
  String? landmark;
  String? city;
  String? state;
  String? pincode;
  List<String>? images;
  String? description;
  String? status;
  String? addedOn;
  String? addedBy;
  String? actionBy;

  ServiceRequestModel(
      {this.requestId,
      this.type,
      this.areaName,
      this.landmark,
      this.city,
      this.state,
      this.pincode,
      this.images,
      this.description,
      this.status,
      this.addedOn,
      this.addedBy,
      this.actionBy});

  factory ServiceRequestModel.fromSnapshot(QueryDocumentSnapshot snapshot) =>
      ServiceRequestModel(
        requestId: snapshot.id,
        type: snapshot['type'] as String?,
        areaName: snapshot['areaName'] as String?,
        landmark: snapshot['landmark'] as String?,
        city: snapshot['city'] as String?,
        state: snapshot['state'] as String?,
        pincode: snapshot['pincode'] as String?,
        images: (snapshot['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        description: snapshot['description'] as String?,
        status: snapshot['status'] as String?,
        addedOn: snapshot['addedOn'] as String?,
        addedBy: snapshot['addedBy'] as String?,
        actionBy: snapshot['actionBy'] as String?,
      );

  static QueryModel toQueryModel(ServiceRequestModel model) => QueryModel(
      queryId: model.requestId,
      heading: model.type,
      title: model.type,
      description: model.description,
      status: model.status,
      timeStamp: model.addedOn);

  factory ServiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceRequestModelToJson(this);
}
