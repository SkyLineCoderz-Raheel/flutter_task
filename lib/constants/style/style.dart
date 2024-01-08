import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// String image_url = "https://phito.be/wp-content/uploads/2020/01/placeholder.png";
String image_url = "https://firebasestorage.googleapis.com/v0/b/fluttertask-14ab3.appspot.com/o/image.png?alt=media&token=d80f104d-b1cb-4caa-b89b-5ac73eb9808e";

// var placeholderImageUrl = "https://www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg";
List<BoxShadow> appBoxShadow = [BoxShadow(blurRadius: 5, color: Color(0x414D5678))];
BoxDecoration roundDecorationWithBorder = BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black26));
BoxDecoration roundDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: appBoxShadow
);
BoxDecoration fiveRoundDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: Colors.white,
    boxShadow: appBoxShadow
);