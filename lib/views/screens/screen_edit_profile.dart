import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/constants/style/style.dart';
import 'package:flutter_task/controllers/controller_edit_profile.dart';
import 'package:flutter_task/views/screens/screen_home_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/file_uploading.dart';
import '../../models/user.dart' as model;
import '../../widgets/custom_svg.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/my_input_feild.dart';

class ScreenEditProfile extends StatelessWidget {
  model.User user;
  ControllerEditProfile controllerEditProfile =
  Get.put(ControllerEditProfile());

  @override
  Widget build(BuildContext context) {
    ControllerEditProfile controllerEditProfile =
    Get.put(ControllerEditProfile());

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
                  ImageCircleContainer(context, controllerEditProfile)
                      .marginSymmetric(vertical: 20),
                  CustomText(
                    text: "Full Name",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "Ali Ahmad",
                    controller: controllerEditProfile.nameController,
                    text: user.name ?? null,
                    keyboardType: TextInputType.name,
                  ),

                  // CustomText(
                  //   text: "Email",
                  //   size: 13,
                  //   fontWeight: FontWeight.w500,
                  //   color: Color(0xFF0D0D0D),
                  // ).marginSymmetric(horizontal: 20),
                  // MyInputField(
                  //   hint: "Enter Your Email Address",
                  //   keyboardType: TextInputType.emailAddress,
                  // ),
                  CustomText(
                    text: "Phone Number",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    controller: controllerEditProfile.phoneController,
                    text: user.phoneNumber ?? null,
                    hint: "+92303030033",
                    keyboardType: TextInputType.number,
                  ),
                  CustomText(
                    text: "Date of Birth",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  Obx(() {
                    return MyInputField(
                      readOnly: false,
                      hint: "${controllerEditProfile.selectedDate.value
                          .day} ${controllerEditProfile.selectedDate.value
                          .month} ${controllerEditProfile.selectedDate.value
                          .year}",
                      onTap: () {
                        controllerEditProfile.selectDate(context);
                      },
                      // hint: "20 jan 2024",
                    );
                  }),
                  CustomText(
                    text: "Birth Gender",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  radioButton(controllerEditProfile),
                ],
              ),
            ),
          ),
          Obx(() {
            return MyCustomButton(
              text: "Update",
              loading: controllerEditProfile.showLoading.value,

              onTap: () async {
                var response = await controllerEditProfile.updateProfile();
                if (response == "success") {
                  Get.offAll(ScreenHomePage());
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profile Updated")));
                  controllerEditProfile.imagePath.value = '';
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response)));
                }
              },
              height: 55,
            );
          }).marginSymmetric(vertical: 20),
        ],
      ),
    );
  }

  Obx radioButton(ControllerEditProfile controllerEditProfile) {
    return Obx(() {
      return Row(
        children: [
          Row(
            children: [
              Radio(
                  value: "Male",
                  groupValue: controllerEditProfile.birthGender.value,
                  onChanged: (gender) {
                    controllerEditProfile.birthGender.value = gender!;
                  }),
              CustomText(
                text: "Male",
                color: controllerEditProfile.birthGender.value == "Male"
                    ? appPrimaryColor
                    : Color(0xFF0D0D0D),
                size: 14,
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: "Female",
                  groupValue: controllerEditProfile.birthGender.value,
                  onChanged: (gender) {
                    controllerEditProfile.birthGender.value = gender!;
                  }),
              CustomText(
                text: "Female",
                color: controllerEditProfile.birthGender.value == "Female"
                    ? appPrimaryColor
                    : Color(0xFF0D0D0D),
                size: 14,
              )
            ],
          ),
        ],
      );
    });
  }

  Widget ImageCircleContainer(BuildContext context,
      ControllerEditProfile controllerEditProfile) {
    return Align(
      alignment: Alignment.center,
      child: Obx(() {
        return Container(
          alignment: Alignment.bottomRight,
          height: Get.height * .12,
          width: Get.height * .12,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade100),
              image: DecorationImage(
                image: controllerEditProfile.imagePath.value == ""
                    ? NetworkImage(image_url)
                    : FileImage(File(controllerEditProfile.imagePath.value))
                as ImageProvider,
              )),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheet(
                    controllerEditProfile,
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration:
              BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: CustomSvg(
                name: "camera",
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget BottomSheet(ControllerEditProfile controllerEditProfile) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: appPrimaryColor),
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_library,
              color: Colors.white,
            ),
            title: Text(
              'Gallery',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              Get.back();
              controllerEditProfile.imagePath.value =
              await FilePick().pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            title: Text(
              'Camera',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () async {
              Get.back();
              controllerEditProfile.imagePath.value =
              await FilePick().pickImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }

  ScreenEditProfile({
    required this.user,
  });
}
