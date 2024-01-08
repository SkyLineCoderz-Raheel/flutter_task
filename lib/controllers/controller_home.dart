import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/helpers/database_reference.dart';
import 'package:flutter_task/helpers/firebase_utils.dart';
import 'package:flutter_task/models/family_member.dart';
import 'package:get/get.dart';
import 'package:flutter_task/models/user.dart' as model;
import '../helpers/fcm.dart';

class ControllerHome extends GetxController{
  Rx<model.User?> user = Rx<model.User?>(null);
  RxList<FamilyMember> familyMemberList = RxList<FamilyMember>([]);


  @override
  void onInit() {
    updateToken();
    UserStream();
    getFamilyMemberList().then((value) {
      familyMemberList.value=value;
      log(familyMemberList.value.toString());
    });
    super.onInit();
  }
  void updateToken() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var token = (await FCM.generateToken()) ?? "";
    DbReference().userRef.doc(uid).update({"notificationToken": token});
  }
  Future<void> UserStream() async {
    DbReference().userRef.doc(DbReference().uid).snapshots().listen((event) {
      user.value = model.User.fromMap(event.data() as Map<String, dynamic>);
      log("${user.value}");
    });
  }

  //Get familyMember method
  Future<List<FamilyMember>> getFamilyMemberList() async {
    try {
      var querySnapshot = await DbReference().familyMemberRef.get();
      List<FamilyMember> familyMemberList = [];

      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        FamilyMember familyMember = FamilyMember.fromMap(data);

        // Check if the userId matches the current user's ID
        if (familyMember.userId == FirebaseUtils.myId) {
          familyMemberList.add(familyMember);
        }
      }

      return familyMemberList;
    } catch (e) {
      print("Error fetching FamilyMember: $e");
      return [];
    }
  }



}