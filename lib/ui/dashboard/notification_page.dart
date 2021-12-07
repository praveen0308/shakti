import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/notification_model.dart';
import 'package:shakti/repository/user_repository.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/notification_item.dart';
import 'package:shakti/ui/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Notifications".toUpperCase(),
            style: AppStyle.mainHeadingStyle,
          ),
          const Text(
            "Updates regarding your query",
            style: AppStyle.captionStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: StreamBuilder<QuerySnapshot>(
              stream: UserRepository.getUserNotifications(user!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        height: 2,
                        color: Colors.black,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var notification = NotificationModel.fromSnapshot(
                            snapshot.data!.docs[index]);

                        return NotificationItem(
                            notificationModel: notification);
                      },
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "No notifications yet!!!",
                        style: AppStyle.pageTitleStyle,
                      ),
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
