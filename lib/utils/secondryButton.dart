
import 'package:flutter/material.dart';
import 'package:organizer/utils/customText.dart';

class secondryOutlineButton extends StatelessWidget {

String title;
Function() ontap;
double? width;
double? height;
BorderSide borderSide;
Color? backColor;
Color? textColor;
   secondryOutlineButton({
    Key? key,
    required this.title,
    required this.ontap,
    this.width,
    this.height,
   required this.borderSide,
    this.backColor,
    this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        side: borderSide,
        borderRadius: BorderRadius.circular(5)
      ),
      onPressed:ontap,child: CustomText(title: title),color: textColor,);
  }
}
