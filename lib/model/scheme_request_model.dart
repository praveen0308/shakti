import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shakti/model/query_model.dart';
part 'scheme_request_model.g.dart';

@JsonSerializable()
class SchemeRequestModel {
  String? requestId;
  String? type;
  String? description;
  String? status;
  String? addedOn;
  String? addedBy;
  String? actionBy;

  SchemeRequestModel(
      {this.requestId,
      this.type,
      this.description,
      this.status,
      this.addedBy,
      this.addedOn,
      this.actionBy});
  factory SchemeRequestModel.fromSnapshot(QueryDocumentSnapshot snapshot) =>
      SchemeRequestModel(
        requestId: snapshot.id,
        type: snapshot['type'] as String?,
        description: snapshot['description'] as String?,
        status: snapshot['status'] as String?,
        addedBy: snapshot['addedBy'] as String?,
        addedOn: snapshot['addedOn'] as String?,
        actionBy: snapshot['actionBy'] as String?,
      );

  static QueryModel toQueryModel(SchemeRequestModel model) => QueryModel(
      queryId: model.requestId,
      heading: model.type,
      title: model.type,
      description: model.description,
      status: model.status,
      timeStamp: model.addedOn);
  factory SchemeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SchemeRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SchemeRequestModelToJson(this);
}
