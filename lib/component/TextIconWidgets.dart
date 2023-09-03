

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class TextIconWidget extends StatelessWidget {
  String title;
   IconData icon;
   Function() ontap;
   IconData? preIcon;
   double? iconSize;
   double? textSize;
   TextIconWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.ontap,
    this.preIcon,
   required this.textSize,
    this.iconSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          MySize(height: 0.04, width: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   preIcon!=null? Icon(
                preIcon,
                color: greyColor,
                size: Get.size.height * 0.04,
              ):Container(),
              MySize(height: 0, width: 0.02),
              CustomText(
                  boxConstraints: BoxConstraints(
                maxWidth: Get.size.width*0.45
              ),
              maxline: 3,
                title: title,
                fontWeight: FontWeight.w500,
                size: textSize,
              ),
                ],
              ),
              Icon(
                icon,
                color: greyColor,
                size: iconSize,
              )
            ],
          ),
          MySize(height: 0.02, width: 0),
          const Divider(
            thickness: 1.5,
          )
        ],
      ),
    );
  
  }
}
