import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/my_input_feild.dart';

class ScreenAddFamilyMembar extends StatelessWidget {
  const ScreenAddFamilyMembar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[

          CustomText(text: "First Name",
            size: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D0D0D),).marginSymmetric(horizontal: 20),
          MyInputField(
            hint: "Ali",
            keyboardType: TextInputType.name,

          ),
          CustomText(text: "Last Name",
            size: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D0D0D),

          ).marginSymmetric(
              horizontal: 20),
          MyInputField(
            hint: "Ahmad",
            keyboardType: TextInputType.name,
          ),
          CustomText(text: "Email",
            size: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D0D0D),).marginSymmetric(horizontal: 20),
          MyInputField(
            hint: "Enter Your Email Address",
            keyboardType: TextInputType.emailAddress,
          ),
          CustomText(text: "Phone Number",
            size: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D0D0D),).marginSymmetric(horizontal: 20),
          MyInputField(
            hint: "+92303030033",
            keyboardType: TextInputType.number,
          ),
          CustomText(text: "Password",
            size: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D0D0D),

          ).marginSymmetric(
              horizontal: 20),
          MyInputField(
            hint: "At least 8 characters",
            isPasswordField: true,

          ),CustomText(text: "Confirm Password",
            size: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D0D0D),

          ).marginSymmetric(
              horizontal: 20),
          MyInputField(
            hint: "Must match the password",
            isPasswordField: true,
          ),
          MyCustomButton(text: "Add", onTap: () {
          },
            height: 55,
          ),
        ],
      ),
    );
  }
}
