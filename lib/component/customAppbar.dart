// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';


class CustomAppBars extends StatelessWidget {
 
 String? title;
 Widget? leadingIcon;
 String? subTitle;
 IconData? prefixIcon;
 double? toolBarHeight;
 Function()? suffixOntap;
 List<Widget>? actionList;
 double? elevation;
 bool isCenter;
   CustomAppBars({
    Key? key,
    this.title,
    this.leadingIcon,
    this.toolBarHeight,
    this.subTitle,
    this.actionList,
    this.suffixOntap,
    this.elevation=0.3,
   required this.isCenter,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight:toolBarHeight ,
      centerTitle: isCenter,
      elevation:elevation,
      backgroundColor: backgroundColor,
      leading: leadingIcon,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CustomText(title: title??"",color: blackColor,size: MediaQuery.of(context).size.height*0.017),
         MySize(height: 0.007, width: 1),
          CustomText(title: subTitle??"",color: blackColor,size: MediaQuery.of(context).size.height*0.013,)
        ],
      ),
      actions: actionList
    );
  }
}
