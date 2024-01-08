import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/views/screens/screen_login.dart';
import 'package:get/get.dart';

class ScreenSetting extends StatelessWidget {
  const ScreenSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"),),
      body: Column(children: [
        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.logout,color: appPrimaryColor,),
          onTap: () async {
            await FirebaseAuth.instance.signOut().then((value) {
              Get.offAll(ScreenLogin());
            }).catchError((error){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.toString())),
              );
            });
          },
        )
      ],),
    );
  }
}
