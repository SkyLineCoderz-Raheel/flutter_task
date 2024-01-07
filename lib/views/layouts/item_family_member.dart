import 'package:flutter/material.dart';
import 'package:flutter_task/constants/style/style.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';

class ItemFamilyMember extends StatelessWidget {
  const ItemFamilyMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(placeholder_url),
        radius: 25,
        ),
        CustomText(text: "Brother",
          color: Color(0xFF3B3B3B),
          fontWeight: FontWeight.w500,
          size: 10,).marginSymmetric(vertical: 5)
      ],
    ).marginAll(10);
  }
}
