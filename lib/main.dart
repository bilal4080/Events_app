// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/app_route.dart';
import 'utils/string.dart';

final box = GetStorage();
void main() async{
  await GetStorage.init();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(      
      debugShowCheckedModeBanner: false,
      title: MyString.title,
      // home: HomePage(),
      // home: HomePage(),
        initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
       
    );
  }
}