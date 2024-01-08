import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/controller_register.dart';
import 'package:flutter_task/views/screens/screen_home_page.dart';
import 'package:get/get.dart';

import '../../constants/colors/colors.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/my_input_feild.dart';

class ScreenSignUp extends StatelessWidget {
  const ScreenSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerRegister controllerRegister = Get.put(ControllerRegister());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomImage(
              width: Get.width,
              name: "login_app_bar",
            ),
            Align(
              alignment: Alignment.center,
              child: CustomImage(
                name: "login_welcome",
              ).marginSymmetric(vertical: 20),
            ),
            CustomText(
              text: "Register an account",
              size: 22,
              fontWeight: FontWeight.w600,
              // color: Color(0xFF0D0D0D),
            ).marginSymmetric(horizontal: 20, vertical: 20),
            CustomText(
              text: "First Name",
              size: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0D0D0D),
            ).marginSymmetric(horizontal: 20),
            MyInputField(
              controller: controllerRegister.firstNameController,
              hint: "Ali",
              keyboardType: TextInputType.name,
            ),
            CustomText(
              text: "Last Name",
              size: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0D0D0D),
            ).marginSymmetric(horizontal: 20),
            MyInputField(
              hint: "Ahmad",
              controller: controllerRegister.lastNameController,
              keyboardType: TextInputType.name,
            ),
            CustomText(
              text: "Email",
              size: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0D0D0D),
            ).marginSymmetric(horizontal: 20),
            MyInputField(
              controller: controllerRegister.emailController,
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
              controller: controllerRegister.phoneNumberController,
              keyboardType: TextInputType.number,
            ),
            CustomText(
              text: "Password",
              size: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0D0D0D),
            ).marginSymmetric(horizontal: 20),
            MyInputField(
              hint: "At least 8 characters",
              controller: controllerRegister.passwordController,
              isPasswordField: true,
            ),
            CustomText(
              text: "Confirm Password",
              size: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0D0D0D),
            ).marginSymmetric(horizontal: 20),
            MyInputField(
              hint: "Must match the password",
              controller: controllerRegister.confirmPasswordController,
              isPasswordField: true,
            ),
            Obx(() {
              return MyCustomButton(
                text: "Create Account",
                onTap: () async {
                  var response = await controllerRegister.userRegister();
                  if (response == "success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User Registered")),
                    );
                    Get.offAll(ScreenHomePage());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response.toString())),
                    );
                  }
                },
                height: 55,
                loading: controllerRegister.signUpLoading.value,
              );
            }),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      text: "Already have an account? ",
                      children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: appPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                    )
                  ])),
            ).marginSymmetric(vertical: 20)
          ],
        ),
      ),
    );
  }
}
