import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/service_model.dart';
import 'package:shakti/res/custom_colors.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;
  final Function(String) onItemClick;

  ServiceItem({Key? key, required this.serviceModel, required this.onItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick(serviceModel.no!);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: MyColor.primary, width: 2.0),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Image.network(
              serviceModel.imgUrl!,
              height: 28,
              width: 28,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              serviceModel.name!,
              style: const TextStyle(color: Colors.black),
            ))
          ],
        ),
      ),
    );
  }
}
