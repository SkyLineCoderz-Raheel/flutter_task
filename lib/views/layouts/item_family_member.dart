import 'package:flutter/material.dart';
import 'package:flutter_task/constants/style/style.dart';
import 'package:flutter_task/models/family_member.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';

class ItemFamilyMember extends StatelessWidget {
FamilyMember familyMember;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(familyMember.imageUrl.isEmpty?image_url:familyMember.imageUrl),
        radius: 25,
        ),
        CustomText(text: familyMember.relation,
          color: Color(0xFF3B3B3B),
          fontWeight: FontWeight.w500,
          size: 10,).marginSymmetric(vertical: 5)
      ],
    ).marginAll(10);
  }

ItemFamilyMember({
    required this.familyMember,
  });
}
