import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/helpers/database_reference.dart';
import 'package:get/get.dart';

import '../helpers/firebase_utils.dart';

class ControllerEditProfile extends GetxController{
RxString birthGender="Male".obs;
RxString imagePath="".obs;
TextEditingController nameController=TextEditingController();
TextEditingController phoneController=TextEditingController();
RxBool showLoading=false.obs;
Future<String> updateProfile() async {
  String response = "";
  String name = nameController.text.trim();
  String phone = phoneController.text.trim();
  print(name);
  print(phone);

  if (imagePath.value.isNotEmpty) {
    showLoading.value = true;
    var url =
    await FirebaseUtils.uploadImage(imagePath.value, "Users/${DbReference().uid}").catchError((error) {
      response = error.toString();
      showLoading.value = false;
    });
    await DbReference().userRef.doc(FirebaseUtils.myId).update({
      "imageUrl": url,
      "name": name,
      "phoneNumber": phone,
      "birthGender": birthGender.value,
      "dob": selectedDate.value.millisecondsSinceEpoch,
    }).then((value) async {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(url);
      response = "success";
      showLoading.value = false;
    }).catchError((error) {
      response = error.toString();

      showLoading.value = false;
    });
  } else {
    showLoading.value = true;
    await DbReference().userRef.doc(FirebaseUtils.myId).update({
      "name": name,
      "phone": phone,
      "birthGender": birthGender.value,
      "dob": selectedDate.value.millisecondsSinceEpoch,
    }).then((value) {
      response = "success";

      showLoading.value = false;
    }).catchError((error) {
      response = error.toString();

      showLoading.value = false;
    });
  }

  return response;
}
Rx<DateTime> selectedDate = DateTime.now().obs;

Future<void> selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate.value,
    firstDate: DateTime(1900),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate.value = pickedDate;
      update();
  }
}


}