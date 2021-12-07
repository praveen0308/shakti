import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  String? title;
  String? description;
  String? status;
  String? timeStamp;

  NotificationModel(
      {this.title, this.description, this.status, this.timeStamp});

  factory NotificationModel.fromSnapshot(QueryDocumentSnapshot snapshot) =>
      NotificationModel(
        title: snapshot['title'] as String?,
        description: snapshot['description'] as String?,
        status: snapshot['status'] as String?,
        timeStamp: snapshot['timeStamp'] as String?,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
