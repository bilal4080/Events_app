// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import 'package:organizer/component/primeryButton.dart';
import 'package:organizer/main.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/screen/auth/create_Password/controller/signupController.dart';
import 'package:organizer/screen/home/home.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class CreatePasswordPage extends StatefulWidget {
  // CreatePasswordPage({super.key});

  String email;
  CreatePasswordPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  bool isValidate = false;

  final controller = Get.put(CreatePasswordController());
  final signUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: CustomText(
            title: "Log in",
            color: blackColor,
            size: Get.size.height * 0.026,
            fontWeight: FontWeight.w900,
          ),
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
          key: signUpKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Spacer(),
              Column(
                children: [
                  MySize(height: 0.04, width: 0),
                  CircleAvatar(
                    maxRadius: Get.size.height * 0.045,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person,
                      color: greyColor,
                    ),
                  ),
                  MySize(height: 0.02, width: 0),
                  CustomText(
                    title: widget.email,
                    size: Get.size.height * 0.02,
                  ),
                  MySize(height: 0.01, width: 0),
                  InkWell(
                      onTap: () {
                        Get.toNamed(Paths.CreateEmailPage);
                      },
                      child: CustomText(
                        title: "Change",
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )),
                  Obx(() => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.size.width * 0.04),
                        child: TextFormField(
                          controller: controller.emailController.value,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(6,
                                errorText: "Should at least 6 character")
                          ]),
                          obscureText: controller.isTrue.value ? true : false,
                          decoration: InputDecoration(
                            suffix: IconButton(
                                onPressed: () {
                                  controller.isTrue.value =
                                      !controller.isTrue.value;
                                },
                                icon: controller.isTrue.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            label: Text("Password"),
                            hintText: "Password",
                          ),
                        ),
                      )),
                  MySize(height: 0.03, width: 0),
                ],
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    MySize(height: 0.03, width: 0),
                    Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(
                            bottom: Get.size.height * 0.02,
                            left: Get.size.width * 0.025,
                            right: Get.size.width * 0.025),
                        child: primeryButton(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                          textSize: Get.size.height * 0.02,
                          title: "Log in",
                          ontap: () {
                            if (signUpKey.currentState!.validate()) {
                              box.write(
                                  "login", controller.emailController.value.text);
                              Get.to(Home(email: widget.email,));
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
                    CustomText(
                      title: "I forgot my password",
                      size: Get.size.height * 0.019,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    MySize(height: 0.02, width: 0)
                  ],
                ),
              )
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
