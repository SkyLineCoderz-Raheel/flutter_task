import 'package:flutter/material.dart';
import 'package:flutter_task/helpers/database_reference.dart';
import 'package:flutter_task/helpers/firebase_utils.dart';
import 'package:flutter_task/models/family_member.dart';
import 'package:get/get.dart';

class ControllerAddFamilyMember extends GetxController {
  RxString birthGender = "Male".obs;
  RxString selectRelation = "Mother".obs;
  RxBool showLoading = false.obs;
  RxString imagePath = "".obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Rx<DateTime> selectedDate = DateTime.now().obs;

  //Add Family Member
  Future<String> addMember() async {
    String response = "";
    String fullName = fullNameController.text;
    String phoneNumber = phoneNumberController.text;
    String id = FirebaseUtils.newId.toString();
    if (fullName.isEmpty && phoneNumber.isEmpty&&imagePath.value.isEmpty) {
      response = "Please Enter FullName and Phone Number";
    } else {
      showLoading.value=true;
      String url =
          await FirebaseUtils.uploadImage(imagePath.value, "FamilyMember/$id")
              .catchError((error) {
        response = error.toString();
        showLoading.value = false;
      });
      ;
      FamilyMember familyMember = FamilyMember(
          id: id,
          userId: FirebaseUtils.myId,
          name: fullName,
          relation: selectRelation.value,
          phoneNumber: phoneNumber,
          birthGender: birthGender.value,
          imageUrl: url,
          timeStamp: FirebaseUtils.newId,
          dob: selectedDate.value.millisecondsSinceEpoch);
      await DbReference()
          .familyMemberRef
          .doc(id)
          .set(familyMember.toMap())
          .then((value) {
        response = "success";
        showLoading.value=false;
      }).catchError((error) {
        response = error.toString();
        showLoading.value=false;
      });
    }

    return response;
  }

  //Pick Date

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
