

import 'package:flutter/material.dart';


class MySize extends StatelessWidget {
  
  double height;
  double width;
   MySize({
    super.key,
   required this.height,
   required this.width
  });
  var mp;

  @override
  Widget build(BuildContext context) {
     mp = MediaQuery.of(context).size;
    return SizedBox(height: mp.height*height,width: mp.width*width,);
  }
}