import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/controller_add_family_member.dart';
import 'package:get/get.dart';

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
    ControllerAddFamilyMember controllerEditProfile = Get.put(
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
                    text: "Relation",
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D0D0D),
                  ).marginSymmetric(horizontal: 20),
                  DropDownWidget(controllerEditProfile),
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
            text: "Add",
            onTap: () {
              // Get.offAll(ScreenHomePage());
            },
            height: 55,
          ).marginSymmetric(vertical: 20),

        ],
      ),
    );
  }
  Widget DropDownWidget(ControllerAddFamilyMember controllerAddFamilyMember) {
    return Obx(() {
      return Column(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10,),
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                  child: Text(value,style: TextStyle(color: Colors.black.withOpacity(.5)),),
                );
              }).toList(),
            ),
          ),
          // Divider()
        ],
      );
    });
  }

}
