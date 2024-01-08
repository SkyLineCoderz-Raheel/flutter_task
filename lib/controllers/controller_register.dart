import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/helpers/database_reference.dart';
import 'package:flutter_task/models/user.dart' as model;
import 'package:get/get.dart';

class ControllerRegister extends GetxController {
  RxBool signUpLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<String> userRegister() async {
    String response = "";
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String phoneNumber = phoneNumberController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    signUpLoading.value = true;
    if (email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        password == confirmPassword &&
        phoneNumber.isNotEmpty) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        print("User Register Successfully");
        print(userCredential);
        var uid = userCredential.user!.uid;
        var user = model.User(
          id: uid,
          name: firstName+ lastName,
          email: email,
          password: password,
          notificationToken: "",
          timeStamp: DateTime.now().microsecondsSinceEpoch,
          imageUrl: "",
          birthGender: "",
          phoneNumber: phoneNumber,
          dob: 0,
        );
        await DbReference().userRef.doc(uid).set(user.toMap()).then((value) {
          response = "success";
          signUpLoading.value = false;
        }).catchError((error) {
          response = error.toString();
          signUpLoading.value = false;
        });
      });
    } else {
      response = "All Fields Required";
      signUpLoading.value = false;
    }

    return response;
  }

}
