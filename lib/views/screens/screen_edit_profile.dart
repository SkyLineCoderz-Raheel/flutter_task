import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/constants/style/style.dart';
import 'package:flutter_task/controllers/controller_edit_profile.dart';
import 'package:get/get.dart';

import '../../widgets/custom_svg.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/my_input_feild.dart';

class ScreenEditProfile extends StatelessWidget {
  const ScreenEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerEditProfile controllerEditProfile = Get.put(
        ControllerEditProfile());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      height: Get.height * .12,
                      width: Get.height * .12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade100),
                          image: DecorationImage(
                            image: NetworkImage(placeholder_url),
                          )),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(ScreenEditProfile());
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: CustomSvg(
                            name: "camera",
                          ),
                        ),
                      ),
                    ),
                  ).marginSymmetric(vertical: 20),
                  CustomText(
                    text: "Full Name",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "Ali Ahmad",
                    keyboardType: TextInputType.name,
                  ),

                  CustomText(
                    text: "Email",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "Enter Your Email Address",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomText(
                    text: "Phone Number",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "+92303030033",
                    keyboardType: TextInputType.number,
                  ),
                  CustomText(
                    text: "Date of Birth",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "20 jan 2024",
                  ),
                  CustomText(
                    text: "Birth Gender",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  Obx(() {
                    return Row(
                      children: [
                        Row(
                          children: [
                            Radio(value: "Male",
                                groupValue: controllerEditProfile.birthGender.value,
                                onChanged: (gender) {
                                  controllerEditProfile.birthGender.value = gender!;
                                }),
                            CustomText(text: "Male",color: controllerEditProfile.birthGender.value=="Male"?appPrimaryColor:Color(0xFF0D0D0D),size: 14,)
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: "Female",
                                groupValue: controllerEditProfile.birthGender.value,
                                onChanged: (gender) {
                                  controllerEditProfile.birthGender.value = gender!;
                                }),
                            CustomText(text: "Female",color: controllerEditProfile.birthGender.value=="Female"?appPrimaryColor:Color(0xFF0D0D0D),size: 14,)

                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          MyCustomButton(
            text: "Update",
            onTap: () {
              // Get.offAll(ScreenHomePage());
            },
            height: 55,
          ).marginSymmetric(vertical: 20),

        ],
      ),
    );
  }
}
