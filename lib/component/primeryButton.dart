import 'package:flutter/material.dart';
import 'package:organizer/utils/customText.dart';

class primeryButton extends StatelessWidget {
  String title;
  Function() ontap;
  Color? backColor;
  Color? textColor;
  double? width;
  IconData? preIcon;
  Color? preIconColor;
  IconData? sufixIcon;
  double? textSize;
  BorderRadiusGeometry borderRadius;
  double? hieght;
  double? laterSpace;
  BorderSide borderSide;
  primeryButton({
    Key? key,
    required this.title,
    required this.ontap,
    this.backColor,
    this.textColor,
    this.width,
    this.preIcon,
    this.sufixIcon,
    this.laterSpace,
   required this.borderSide,
    this.textSize,
    this.hieght,
    this.preIconColor=Colors.white,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: hieght,
      color: backColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius,
      side: borderSide
      ),
      onPressed: ontap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(preIcon,color: preIconColor,),
          const SizedBox(width: 7,),
          CustomText(
            title: title,
            latterSpace: laterSpace,
            color: textColor,
            
            size: textSize,
          ),
          const SizedBox(width: 7,),
            Icon(sufixIcon,color: Colors.white,),
        ],
      ),
    );
  }
}
