import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/notification_model.dart';
import 'package:shakti/repository/service_repository.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/query_item.dart';
import 'package:shakti/ui/widgets/widgets.dart';

class MyQueryPage extends StatefulWidget {
  const MyQueryPage({Key? key}) : super(key: key);

  @override
  _MyQueryPageState createState() => _MyQueryPageState();
}

class _MyQueryPageState extends State<MyQueryPage> {
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
            "My query".toUpperCase(),
            style: AppStyle.mainHeadingStyle,
          ),
          const Text(
            "All your past queries are here",
            style: AppStyle.captionStyle,
          ),
          Expanded(
              child: ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: FutureBuilder(
                future: ServiceRepository.getQueriesByUserId(user!.uid ?? ""),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                              height: 2,
                              color: Colors.black,
                            ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return QueryItem(queryModel: snapshot.data[index]);
                        });
                  }
                }),
          ))
        ],
      ),
    );
  }
}
