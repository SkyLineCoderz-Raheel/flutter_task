import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  RxBool check = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginLoading = false.obs;

  Future<String> userLogin() async {
    String response = "";
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      loginLoading.value=true;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        loginLoading.value=false;

        response = "success";
      }).catchError((error) {
        loginLoading.value=false;

        response = error.toString();
      });
    } else {
      response = "Email and Password is required";
    }
    return response;
  }
}
