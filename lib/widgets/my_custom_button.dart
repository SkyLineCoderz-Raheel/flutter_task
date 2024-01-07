
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../constants/colors/colors.dart';

class MyCustomButton extends StatelessWidget {
  String text;
  double? fontSize;
  Callback onTap;
    bool? isRound;
    double? width;
    double? height;
    EdgeInsetsGeometry? margin;
  Color? buttonColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        margin:margin??EdgeInsets.symmetric(vertical:15,horizontal: 20) ,
        alignment: Alignment.center,
        height:height?? 55,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: isRound==true?BorderRadius.circular(30):BorderRadius.circular(10),
          color: buttonColor??appPrimaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize:fontSize ?? 16,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w700,
              color: textColor??Colors.white),
        ),
      ),
    );
  }

  MyCustomButton({
    required this.text,
    required this.onTap,
    this.isRound,
    this.width,
    this.height,
    this.fontSize,
    this.buttonColor,
    this.textColor,
  });
}
