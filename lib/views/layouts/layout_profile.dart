import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/controllers/controller_home.dart';
import 'package:flutter_task/helpers/calculate_age.dart';
import 'package:flutter_task/models/family_member.dart';
import 'package:flutter_task/views/layouts/item_appointments.dart';
import 'package:flutter_task/views/layouts/item_family_member.dart';
import 'package:flutter_task/views/screens/screen_add_family_membar.dart';
import 'package:flutter_task/views/screens/screen_edit_profile.dart';
import 'package:flutter_task/views/screens/screen_setting.dart';
import 'package:flutter_task/widgets/custom_container.dart';
import 'package:flutter_task/widgets/custom_listview_builder.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../constants/style/style.dart';
import '../../widgets/custom_svg.dart';

class LayoutProfile extends StatelessWidget {
  const LayoutProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerHome controllerHome=Get.find<ControllerHome>();
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          color: Color(0xFF86022E),
          image: DecorationImage(
              image: AssetImage("assets/images/backgroud.png"),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomSvg(
                  name: "menu",
                ),
                CustomText(
                  text: "My Profile",
                  color: Colors.white,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                    onPressed: () {
                      Get.to(ScreenSetting());
                    },
                    icon: CustomSvg(
                      name: "setting",
                    ))
              ],
            ).marginSymmetric(horizontal: 20, vertical: 25),
            Expanded(
                child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  color: Colors.white),
              child: controllerHome.user.value == null
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.bottomRight,
                            height: Get.height * .12,
                            width: Get.height * .12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade100),
                                image: DecorationImage(
                                  image: NetworkImage(controllerHome.user.value!.imageUrl.isEmpty?placeholder_url:controllerHome.user.value!.imageUrl),
                                )),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ScreenEditProfile(user: controllerHome.user.value!,));
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: appPrimaryColor,
                                    shape: BoxShape.circle),
                                child: CustomSvg(
                                  name: "Pencil",
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: controllerHome.user.value!.name,
                            color: Color(0xFF252B5C),
                            fontWeight: FontWeight.w700,
                            size: 14,
                          ).marginSymmetric(vertical: 8),
                          CustomText(
                            text: controllerHome.user.value!.email,
                            color: Color(0xFF53587A),
                            fontWeight: FontWeight.w500,
                            size: 12,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomContainer(
                                    title: controllerHome.user.value!.dob==0?"Not Specify":CalculateAge().calculateAgeFromMilliseconds(controllerHome.user.value!.dob), subtitle: "Age"),
                                CustomContainer(
                                    title: controllerHome.user.value!.birthGender.isEmpty?"No Specify":controllerHome.user.value!.birthGender, subtitle: "Birth Gender"),
                              ]).marginSymmetric(vertical: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: "Family Members",
                              color: Color(0xFF0D0D0D),
                              fontWeight: FontWeight.w600,
                              size: 16,
                            ),
                          ).marginSymmetric(horizontal: 20, vertical: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CustomListviewBuilder(
                                      itemCount: controllerHome.familyMemberList.length,
                                      scrollDirection: CustomDirection.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        FamilyMember familyMember=controllerHome.familyMemberList[index];
                                        return ItemFamilyMember(familyMember: familyMember,);
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ScreenAddFamilyMembar());
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration:
                                            BoxDecoration(shape: BoxShape.circle),
                                        child: Column(
                                          children: <Widget>[
                                            DottedBorder(
                                              radius: Radius.circular(30),
                                              borderType: BorderType.Circle,
                                              child: CircleAvatar(
                                                child: Icon(Icons.add,color: appPrimaryColor,),
                                                radius: 25,
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                            CustomText(
                                              text: "Add",
                                              color: appPrimaryColor,
                                              fontWeight: FontWeight.w500,
                                              size: 10,
                                            ).marginSymmetric(vertical: 5)
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: "Past Appointments",
                              color: Color(0xFF0D0D0D),
                              fontWeight: FontWeight.w600,
                              size: 16,
                            ),
                          ).marginSymmetric(horizontal: 20, vertical: 8),
                          CustomListviewBuilder(
                            itemCount: 3,
                            scrollDirection: CustomDirection.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemAppointments();
                            },
                          ).marginOnly(bottom: 60)
                        ],
                      ),
                    ),
            ))
          ],
        ),
      ),
    );
  }
}
