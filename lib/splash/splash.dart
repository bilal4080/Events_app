import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/sizedbox.dart';

import '../utils/customText.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
Timer(const Duration(seconds: 3), () { 
  Get.toNamed(Paths.RegisterAccount);
});
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/logo.PNG"))
        ),
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          
           MySize(height: 0.2, width: 0)
           ,const Center(child: CircularProgressIndicator(
            color: Colors.white,
           ),)
            ],
          ),
        ),
      ),
    );
  }
}