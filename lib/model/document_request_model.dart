import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shakti/model/query_model.dart';
part 'document_request_model.g.dart';

@JsonSerializable()
class DocumentRequestModel {
  String? requestId;
  String? type;
  String? description;
  String? status;
  String? addedOn;
  String? addedBy;
  String? actionBy;

  DocumentRequestModel(
      {this.requestId,
      this.type,
      this.description,
      this.status,
      this.addedBy,
      this.addedOn,
      this.actionBy});

  factory DocumentRequestModel.fromSnapshot(QueryDocumentSnapshot snapshot) =>
      DocumentRequestModel(
        requestId: snapshot.id,
        type: snapshot['type'] as String?,
        description: snapshot['description'] as String?,
        status: snapshot['status'] as String?,
        addedBy: snapshot['addedBy'] as String?,
        addedOn: snapshot['addedOn'] as String?,
        actionBy: snapshot['actionBy'] as String?,
      );

  static QueryModel toQueryModel(DocumentRequestModel model) => QueryModel(
      queryId: model.requestId,
      heading: model.type,
      title: model.type,
      description: model.description,
      status: model.status,
      timeStamp: model.addedOn);

  factory DocumentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentRequestModelToJson(this);
}
