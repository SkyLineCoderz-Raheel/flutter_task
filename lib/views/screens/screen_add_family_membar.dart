import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/controller_add_family_member.dart';
import 'package:flutter_task/helpers/file_uploading.dart';
import 'package:flutter_task/views/screens/screen_home_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors/colors.dart';
import '../../constants/style/style.dart';
import '../../widgets/custom_svg.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/my_input_feild.dart';

class ScreenAddFamilyMembar extends StatelessWidget {
  const ScreenAddFamilyMembar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerAddFamilyMember controllerAddFamilyMember = Get.put(
        ControllerAddFamilyMember());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Family Membar"),
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
                  ImageCircleContainer(context, controllerAddFamilyMember)
                      .marginSymmetric(vertical: 20),
                  CustomText(
                    text: "Full Name",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "Ali Ahmad",
                    controller: controllerAddFamilyMember.fullNameController,
                    keyboardType: TextInputType.name,
                  ),

                  CustomText(
                    text: "Relation",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  DropDownWidget(controllerAddFamilyMember),
                  CustomText(
                    text: "Phone Number",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  MyInputField(
                    hint: "+92303030033",
                    controller: controllerAddFamilyMember.phoneNumberController,
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
                      hint: "${controllerAddFamilyMember.selectedDate.value
                          .day} ${controllerAddFamilyMember.selectedDate.value
                          .month} ${controllerAddFamilyMember.selectedDate.value
                          .year}",
                      onTap: () {
                        controllerAddFamilyMember.selectDate(context);
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
                  Obx(() {
                    return Row(
                      children: [
                        Row(
                          children: [
                            Radio(value: "Male",
                                groupValue: controllerAddFamilyMember
                                    .birthGender.value,
                                onChanged: (gender) {
                                  controllerAddFamilyMember.birthGender.value =
                                  gender!;
                                }),
                            CustomText(text: "Male",
                              color: controllerAddFamilyMember.birthGender
                                  .value == "Male" ? appPrimaryColor : Color(
                                  0xFF0D0D0D),
                              size: 14,)
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: "Female",
                                groupValue: controllerAddFamilyMember
                                    .birthGender.value,
                                onChanged: (gender) {
                                  controllerAddFamilyMember.birthGender.value =
                                  gender!;
                                }),
                            CustomText(text: "Female",
                              color: controllerAddFamilyMember.birthGender
                                  .value == "Female" ? appPrimaryColor : Color(
                                  0xFF0D0D0D),
                              size: 14,)

                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          Obx(() {
            return MyCustomButton(
              text: "Add",
              loading: controllerAddFamilyMember.showLoading.value,
              onTap: () async {
                var response = await controllerAddFamilyMember.addMember();
                if (response == "success") {
                  Get.offAll(ScreenHomePage());
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Family Member Added...")));
                  controllerAddFamilyMember.imagePath.value = '';
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

  Widget ImageCircleContainer(BuildContext context,
      ControllerAddFamilyMember controllerAddFamilyMember) {
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
                image: controllerAddFamilyMember.imagePath.value == ""
                    ? NetworkImage(placeholder_url)
                    : FileImage(File(controllerAddFamilyMember.imagePath
                    .value)) as ImageProvider,
              )),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheet(controllerAddFamilyMember,);
                },
              );
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
        );
      }),
    );
  }

  Widget DropDownWidget(ControllerAddFamilyMember controllerAddFamilyMember) {
    return Obx(() {
      return Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10,),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                border: Border.all(color: Colors.black.withOpacity(.1)),
                color: Colors.white),

            child: DropdownButton<String>(
              value: controllerAddFamilyMember.selectRelation.value,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black.withOpacity(.5),
              ),
              iconSize: 30,
              // elevation: 16,

              style: TextStyle(color: appPrimaryColor),
              underline: SizedBox(),
              isExpanded: true,
              onChanged: (String? newValue) {
                controllerAddFamilyMember.selectRelation.value = newValue!;
              },
              items: <String>[
                'Mother',
                'Grand Mother',
                'Grand Father',
                'Father',
                'Brother',
                'Sister',
                'Wife',
                'Son',
                'Daughter',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.black
                      .withOpacity(.5)),),
                );
              }).toList(),
            ),
          ),
          // Divider()
        ],
      );
    });
  }


  Widget BottomSheet(ControllerAddFamilyMember controllerAddFamilyMember) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: appPrimaryColor
      ),
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_library, color: Colors.white,),
            title: Text('Gallery', style: TextStyle(color: Colors.white),),
            onTap: () async {
              Get.back();
              controllerAddFamilyMember.imagePath.value =
              await FilePick().pickImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.white,),
            title: Text('Camera', style: TextStyle(color: Colors.white),),
            onTap: () async {
              Get.back();
              controllerAddFamilyMember.imagePath.value =
              await FilePick().pickImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
// class BottomSheetWidget extends StatelessWidget {
// ControllerAddFamilyMember controllerAddFamilyMember;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         color: appPrimaryColor
//       ),
//       child: Wrap(
//         children: <Widget>[
//           ListTile(
//             leading: Icon(Icons.photo_library,color: Colors.white,),
//             title: Text('Gallery',style: TextStyle(color: Colors.white),),
//             onTap: () async {
//               controllerAddFamilyMember.imagePath.value= await FilePick().pickImage(ImageSource.gallery);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.camera_alt,color: Colors.white,),
//             title: Text('Camera',style: TextStyle(color: Colors.white),),
//             onTap: () async {
//               controllerAddFamilyMember.imagePath.value= await FilePick().pickImage(ImageSource.camera);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
// BottomSheetWidget({
//     required this.controllerAddFamilyMember,
//   });
// }

