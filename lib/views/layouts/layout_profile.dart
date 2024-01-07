import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/views/layouts/item_appointments.dart';
import 'package:flutter_task/views/layouts/item_family_member.dart';
import 'package:flutter_task/widgets/custom_container.dart';
import 'package:flutter_task/widgets/custom_listview_builder.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/style/style.dart';
import '../../widgets/custom_svg.dart';

class LayoutProfile extends StatelessWidget {
  const LayoutProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xFF86022E),
          image: DecorationImage(
              image: AssetImage("assets/images/backgroud.png"),
              fit: BoxFit.cover
          )
      ),
    child: SafeArea(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSvg(name: "menu",),
                CustomText(text: "My Profile",color: Colors.white,size: 16,fontWeight: FontWeight.w600,),
                CustomSvg(name: "setting",)
              ],
            ).marginSymmetric(horizontal: 20,vertical: 25),
            Expanded(
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24),
                      ),
                      color: Colors.white
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomRight,
                        height: Get.height*.12,
                        width: Get.height*.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade100),
                            image: DecorationImage(image: NetworkImage(placeholder_url),)
                        ),
                        child: Container(

                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: appPrimaryColor,
                              shape: BoxShape.circle
                          ),
                          child: CustomSvg(name: "Pencil",),

                      ),

                      ),
                      CustomText(text: "Name",
                      color: Color(0xFF252B5C),
                        fontWeight: FontWeight.w700,
                        size: 14,
                      ),
                      CustomText(text: "abc@gmail.com",
                        color: Color(0xFF53587A),
                        fontWeight: FontWeight.w500,
                        size: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomContainer(title: "23y 4m", subtitle: "Age"),
                        CustomContainer(title: "Male", subtitle: "Birth Gender"),
                      ]                  ),
                      CustomText(text: "Family Members",
                        color: Color(0xFF0D0D0D),
                        fontWeight: FontWeight.w600,
                        size: 16,
                      ),
                      Row(
                      children: <Widget>[
                        CustomListviewBuilder( itemCount: 2, scrollDirection: CustomDirection.horizontal, itemBuilder: (BuildContext context, int index) {
                          return ItemFamilyMember();
                        },),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          child: Column(
                            children: <Widget>[

                              DottedBorder(
                              radius: Radius.circular(30),
                                borderType: BorderType.Circle,
                                child: CircleAvatar(

                                  child: Icon(Icons.add),
                                  radius: 25,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              CustomText(text: "Add",
                                color:appPrimaryColor,
                                fontWeight: FontWeight.w500,
                                size: 10,).marginSymmetric(vertical: 5)

                            ],
                          ),
                        )
                      ]                  ),
                      CustomText(text: "Past Appointments",
                        color: Color(0xFF0D0D0D),
                        fontWeight: FontWeight.w600,
                        size: 16,
                      ),
                      CustomListviewBuilder( itemCount: 10, scrollDirection: CustomDirection.vertical, itemBuilder: (BuildContext context, int index) {
                        return ItemAppointments();
                      },)

                  ],
                  ),
                ),
                ))

          ],
        ),
      ),);
  }
}
