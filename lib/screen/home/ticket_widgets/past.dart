
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class Past extends StatelessWidget {
  const Past({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.size.width*0.15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
       
    
            Container(
              height: Get.size.height*0.2,
              width: Get.size.width*0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: greyColor,width: 1.5)
              ),
              child: Icon(
                Icons.calendar_month_outlined,
                color: greyColor,
                size: Get.size.height * 0.08,
              ),
            ),
        
            CustomText(
              title: "You don't have any past events",
              size: Get.size.height * 0.018,
              textAlign: TextAlign.center,
              color: greyColor,
            ),
          
          ],
        ),
      ),
    );
 
  }
}
