import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/notification_model.dart';
import 'package:shakti/model/query_model.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/styles.dart';

class QueryItem extends StatelessWidget {
  final QueryModel queryModel;

  const QueryItem({Key? key, required this.queryModel}) : super(key: key);

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
              queryModel.heading!,
              style: AppStyle.title2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Query submitted on : ${queryModel.timeStamp}"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                queryModel.title!,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(queryModel.description!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "View More".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: MyColor.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
