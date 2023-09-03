// ignore_for_file: use_key_in_widget_constructors, avoid_print


import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:organizer/component/primeryButton.dart';
import 'package:organizer/main.dart';
import 'package:organizer/screen/auth/create_Password/create_Password.dart';
import 'package:organizer/screen/auth/create_email/controller/signupController.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class CreateEmailPage extends StatefulWidget {
  // CreateEmailPage({super.key});

  @override
  State<CreateEmailPage> createState() => _CreateEmailPageState();
}

class _CreateEmailPageState extends State<CreateEmailPage> {
  bool isValidate = false;

  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: CustomText(title: "Log in or Sign up",color: blackColor,size: Get.size.height*0.026,fontWeight: FontWeight.w900,),
          backgroundColor: backgroundColor,
          elevation: 5,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              )),
        ),
        body: Form(
          key: controller.signUpKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.04),
            child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer(),
                MySize(height: 0.03, width: 0),
                TextFormField(
                  controller: controller.emailController.value,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required"),
                    EmailValidator(errorText: "Enter Valid Email")
                  ]),
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    hintText: "Email",
                  ),
                ),
                Spacer(),
             
                MySize(height: 0.03, width: 0),
                Container(
                    margin: EdgeInsets.only(
                        bottom: Get.size.height * 0.02,
                        left: Get.size.width * 0.025,
                        right: Get.size.width * 0.025),
                    child: primeryButton(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                      textSize: Get.size.height*0.02,
                      title: "Next",
                      ontap: () {
                        if (controller.signUpKey.currentState!.validate()) {
                          box.write("login",  controller.emailController.value.text);
                          Get.to(CreatePasswordPage(
                            
                            email: controller.emailController.value.text,
                          ));
                        } else {
                          Get.snackbar("Error", "Not Valid Email",
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                      width: double.infinity,
                      hieght: MediaQuery.of(context).size.height * 0.065,
                      backColor: primeryColor,
                      textColor: Colors.white,
                    )),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
