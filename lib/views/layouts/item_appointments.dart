import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/constants/style/style.dart';
import 'package:flutter_task/widgets/custom_svg.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';

class ItemAppointments extends StatelessWidget {
  const ItemAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: appBoxShadow
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(image_url),
          ),
          Expanded(child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Expanded(
                      child: CustomText(text: "Dr. Abram George",
                      color: Color(0xFF18273B),
                        textAlign: TextAlign.start,
                        maxLine: 1,
                        textOverflow: TextOverflow.ellipsis,
                        size: 16,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                    CustomText(text: "\$ 70",),
                  ],
                ).marginSymmetric(vertical: 5),
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                      color: appPrimaryColor.withOpacity(.1) ,
                      borderRadius: BorderRadius.circular(6)  
                      ),
                      child: Row(
                        children: <Widget>[
                          CustomSvg(
                            name: "heart",
                          ).marginSymmetric(horizontal: 4),
                          CustomText(text: "4.0",
                            color: appPrimaryColor,
                            size: 8,
                            fontWeight: FontWeight.w600,

                          ).marginSymmetric(horizontal: 4)
                        ],
                      ),
                    ).marginOnly(right: 12),
                    CustomText(text: "Submitted",
                      color: Color(0xFF86022E),
                      size: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ).marginSymmetric(vertical: 5),
                Row(
                  children: <Widget>[
                    CustomSvg(
                      name: "video",
                    ).marginOnly(right: 10),
                    CustomText(text: "Video Session",
                      color: Color(0xFF18273B),
                      size: 8,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ).marginSymmetric(vertical: 5),
                Row(
                  children: <Widget>[

                    Expanded(
                      child: CustomText(text: "Hassan Khalid (Other)",
                        size: 9,
                        maxLine: 1,
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: CustomText(text: "Monday, OCT 20, 08:00 PM",
                        size: 9,
                        maxLine: 1,
                        textAlign: TextAlign.end,

                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ).marginSymmetric(vertical: 5),
              ],
            ).marginOnly(left: 5),
          )
        ],
      ),

    );
  }
}
