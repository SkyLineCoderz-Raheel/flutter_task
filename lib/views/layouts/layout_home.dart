import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors/colors.dart';
import 'package:flutter_task/controllers/controller_home.dart';
import 'package:flutter_task/views/layouts/item_health_article.dart';
import 'package:flutter_task/widgets/custom_listview_builder.dart';
import 'package:flutter_task/widgets/custom_svg.dart';
import 'package:flutter_task/widgets/my_custom_button.dart';
import 'package:get/get.dart';

import '../../constants/style/style.dart';
import '../../widgets/custom_text.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Color(0xFF86022E),
        image: DecorationImage(
          image: AssetImage("assets/images/backgroud.png"),
          fit: BoxFit.cover
        )
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          CustomSvg(name: "menu",).marginOnly(left: 20,top: 30),
          CustomText(
           text: "Hey, ${Get.find<ControllerHome>().user.value!.name ?? " No user"}! ",
            fontWeight: FontWeight.w600,
            size: 24,
            color: Colors.white,
          ).marginSymmetric(horizontal: 20,vertical: 10),
            CustomText(text: "Wanna Book appointment?",
              fontWeight: FontWeight.w500,
              size: 14,
              color: Color(0xFFE2E2E2),

            ).marginSymmetric(horizontal: 20,vertical: 10),
            MyCustomButton(text: "Book Appointment", onTap: (){}, loading: false,).marginOnly(bottom: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24),
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  CustomText(text: "You have an upcoming appointment!!",
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    size: 14,
                    color: Color(0xFF3B3B3B),

                  ).marginSymmetric(horizontal: 20,vertical: 10),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          image_url
                      ),
                    ),
                    title: CustomText(
                      text: "Dr. Emma Mia",
                      fontWeight: FontWeight.w600,
                      size: 20,
                      color: Color(0xFF0D0D0D),
                      textOverflow: TextOverflow.ellipsis,
                      maxLine: 1,

                    ),
                    trailing: OutlinedButton(
                      style:OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: appPrimaryColor,
                          width: 1.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Border radius
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        textStyle: TextStyle(fontSize: 16.0),
                        backgroundColor: Colors.transparent,
                      // Color when pressed
                      ),
                      onPressed: () {

                    }, child: CustomText(text: 'Attend Now',color: appPrimaryColor,),),
                  ),
                  Container(
                    padding:EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                    margin:EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(color: appPrimaryColor.withOpacity(.1
                    ),
                    borderRadius: BorderRadius.circular(25),


                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              CustomSvg(name: "calendar",).marginOnly(right: 5),
                              Expanded(
                                child: CustomText(text:"Monday, May 12",size: 14,textOverflow: TextOverflow.ellipsis,
                                  maxLine: 1,),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              CustomSvg(name: "timmer",).marginOnly(right: 10),
                              Expanded(
                                child: CustomText(text:"11:00 - 12:00 Am",size: 14,
                                textOverflow: TextOverflow.ellipsis,
                                    maxLine: 1,),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: CustomText(
                      text: "Health Articles",
                      size: 16,
                        fontWeight: FontWeight.w600,

                    ),
                    trailing: TextButton(onPressed: () {  }, child: Text("See All",style: TextStyle(color: Color(0xFF525A66)),),),
                  ),
                  CustomListviewBuilder(
                    itemCount: 2,
                    scrollDirection: CustomDirection.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                    return ItemHealthArticle();
                  },)


                ],),
              ),
            )

        ],),
      ),
    );
  }
}
