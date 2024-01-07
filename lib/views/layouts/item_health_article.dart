import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_image.dart';
import '../../widgets/custom_svg.dart';
import '../../widgets/custom_text.dart';

class ItemHealthArticle extends StatelessWidget {
  const ItemHealthArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*.17,
      margin: EdgeInsets.symmetric(horizontal: 8),
      // padding:
      width: Get.width*.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFEF81A6),
          // image: DecorationImage(
          //     fit: BoxFit.cover,
          //     //
          //     image: AssetImage("assets/images/background_card.png"))
      ),
      child: Stack(children: [
        Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage(
                name: "background_card3",
                boxFit: BoxFit.cover,
                // height: Get.height,
              ),
            )),
        Positioned(
            right: 1,
            bottom: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              child: CustomSvg(
                name: "last",
                height: 80,
              
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: '02 July 2022',
                      color: Colors.white,
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomSvg(
                      name: "bookmark",
                    )
                  ],)
            ),
            Expanded(
              child: CustomText(text: "COVID- 19 Vaccine",
                color: Colors.white,
                size: 16,
                fontWeight: FontWeight.w700,),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomText(
                      textAlign: TextAlign.start,
                      color: Colors.white,
                      size: 12,
                      fontWeight: FontWeight.w600,
                      text: 'Official public service announcement on coronavirus from the world health',
                    ),
                  ),
                  CustomSvg(
                    name: "arrow-forward",
                  )
                ],
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 20,vertical: 5),
      ],),
    );
  }
}
