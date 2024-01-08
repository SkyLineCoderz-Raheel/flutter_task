import 'package:flutter/material.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomContainer extends StatelessWidget {
String title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      width: Get.width*.3,
      height: Get.height*.1,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFECEDF3),
          
        ),
        borderRadius: BorderRadius.circular(22)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CustomText(text: title,
        color: Color(0xFF252B5C),

          size: 14,
          maxLine: 1,
          textOverflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w700,
        ),
        CustomText(text: subtitle,
          color: Color(0xFF53587A),
          size: 12,
          maxLine: 1,
          textOverflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w500,),
      ],),
    );
  }

CustomContainer({
    required this.title,
    required this.subtitle,
  });
}
