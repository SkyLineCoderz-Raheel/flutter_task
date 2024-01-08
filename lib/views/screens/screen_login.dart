import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controllers/controller_login.dart';
import 'package:flutter_task/views/screens/screen_home_page.dart';
import 'package:flutter_task/views/screens/screen_sign_up.dart';
import 'package:flutter_task/widgets/custom_image.dart';
import 'package:flutter_task/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../constants/colors/colors.dart';
import '../../widgets/my_custom_button.dart';
import '../../widgets/my_input_feild.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerLogin controllerLogin = Get.put(ControllerLogin());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                        text: "Login to your Account",
                        size: 22,
                        fontWeight: FontWeight.w600,
                        // color: Color(0xFF0D0D0D),
                      ).marginSymmetric(horizontal: 20, vertical: 20),
                      CustomText(
                        text: "Email",
                        size: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0D0D0D),
                      ).marginSymmetric(horizontal: 20),
                      MyInputField(
                        hint: "abc@gmail.com",
                        controller: controllerLogin.emailController,
                      ),
                      CustomText(
                        text: "Password",
                        size: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0D0D0D),
                      ).marginSymmetric(horizontal: 20),
                      MyInputField(
                        hint: "At least 8 characters",
                        isPasswordField: true,
                        controller: controllerLogin.passwordController,
                      ),
                      Row(
                        children: <Widget>[
                          Obx(() {
                            return Checkbox(
                                value: controllerLogin.check.value,
                                onChanged: (value) {
                                  controllerLogin.check.value = value!;
                                });
                          }),
                          Text(
                            "Remember me ",
                            style: TextStyle(color: Color(0xFF6E6B7B)),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Color(0xFF6A6A6A)),
                            ),
                          )
                        ],
                      ).marginSymmetric(vertical: 5, horizontal: 12),
                      Obx(() {
                        return MyCustomButton(
                          text: "Login",
                          onTap: () async {
                            var response = await controllerLogin.userLogin();
                            if (response == "success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("User Login")),
                              );
                              Get.offAll(ScreenHomePage());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response.toString())),
                              );
                            }
                          },
                          height: 55,
                          loading: controllerLogin.loginLoading.value,
                        );
                      }),
                    ],
                  )),
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    text: "Don’t have an account? ",
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                            color: appPrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(ScreenSignUp()),
                      )
                    ])).marginSymmetric(horizontal: 20, vertical: 20),
          ],
        ));
  }
}
