// ignore_for_file: file_name
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/component/primeryButton.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:  Icon(Icons.arrow_back,color: blackColor,)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.size.width*0.06),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomText(
                  title: "Let's get started",
                  fontWeight: FontWeight.w900,
                  size: Get.size.height * 0.035,
                  latterSpace: 0.6,
                ),
                MySize(height: 0.02, width: 0),
                 CustomText(
                  title: "Sign up or log in to see what's happening near you",
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.justify,
                  size: Get.size.height * 0.019,
                  // latterSpace: 0.5,
                ),
                  MySize(height: 0.12, width: 0),
      
                  primeryButton(
                     borderSide:BorderSide.none,
                    laterSpace: 0.2,
                    backColor: primeryColor,
                    textColor: Colors.white,
                    hieght: Get.size.height*0.07,
                    textSize: Get.size.height*0.019,
                    width: Get.size.width,
                    title: "Continue with email address", ontap: (){
                      Get.toNamed(Paths.CreateEmailPage);
                    }, borderRadius: BorderRadius.circular(5),
                  
                  ),
                    MySize(height: 0.02, width: 0),
                    primeryButton(
                        borderSide: BorderSide(
                      color: greyColor,
                      width: 1.5
                     ),
                      preIcon: Icons.facebook,
                      preIconColor: Colors.blue,
                    laterSpace: 0.2,
                    // backColor: primeryColor,
                    textColor: blackColor,
                    hieght: Get.size.height*0.07,
                    textSize: Get.size.height*0.019,
                    width: Get.size.width,
                    title: "Continue with Facebook", ontap: (){}, borderRadius: BorderRadius.circular(5),
                  
                  ),
                    MySize(height: 0.02, width: 0),
                     primeryButton(
                        borderSide: BorderSide(
                      color: greyColor,
                      width: 1.5
                     ),
                      preIcon: Icons.g_mobiledata_outlined,
                      preIconColor: blackColor,
                    laterSpace: 0.2,
                    textColor: blackColor,
                    hieght: Get.size.height*0.07,
                    textSize: Get.size.height*0.019,
                    width: Get.size.width,
                    title: "Continue with Google", ontap: (){}, borderRadius: BorderRadius.circular(5),
                  
                  ),
      
                    MySize(height: 0.02, width: 0),
                 Center(
                   child: CustomText(
                    title: "I bought tickets, but I don't have an account.",
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.justify,
                    color: Colors.blue,
                    size: Get.size.height * 0.018,
                    // latterSpace: 0.5,
                               ),
                 ),
            ],
          ),
        ),
      ),
    );
  }
}