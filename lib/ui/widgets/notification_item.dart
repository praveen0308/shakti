import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/notification_model.dart';
import 'package:shakti/res/styles.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationItem({Key? key, required this.notificationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notificationModel.title ?? "No title",
              style: AppStyle.title2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(notificationModel.description ?? "No description"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  notificationModel.status!.toUpperCase(),
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  notificationModel.timeStamp!,
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
