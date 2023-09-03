// ignore_for_file: must_be_immutable, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String title;
  double? size;
  FontWeight? fontWeight;
  Color? color;
  double? latterSpace;
  int? maxline;
  double? heightSpace;
  
  TextAlign? textAlign;
  BoxConstraints? boxConstraints;

  CustomText({
    Key? key,
    required this.title,
    this.size,
    this.fontWeight,
    this.latterSpace,
    this.heightSpace,
    this.color,
    this.maxline=5,
    this.textAlign,
    this.boxConstraints
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:boxConstraints,
      child: Text(
        
        title,
        overflow: TextOverflow.ellipsis,
        textAlign:textAlign ,
        maxLines: maxline,
        style: TextStyle(
          height:heightSpace ,
            fontWeight: fontWeight,
            fontSize: size,
            color: color,
            letterSpacing: latterSpace),
      ),
    );
  }
}
