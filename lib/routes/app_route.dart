// ignore_for_file: constant_identifier_names, prefer_const_constructors





import 'package:get/get.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/screen/auth/select_registerType/register.dart';
import 'package:organizer/screen/auth/create_email/create_email.dart';
import 'package:organizer/screen/enter_event/event_title.dart';
import 'package:organizer/screen/home/home.dart';
import 'package:organizer/screen/searchLocation/searchLocation.dart';
import 'package:organizer/splash/splash.dart';

import '../screen/auth/create_Password/create_Password.dart';class AppPages {
  static const INITIAL = Routes.SplashScreen;

  static final routes = [
 
         GetPage(
        name: Paths.RegisterAccount,
        page: () => RegisterAccount(),
        transition: Transition.fadeIn),
  
        GetPage(
        name: Paths.SplashScreen,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),

    GetPage(
        name: Paths.CreateEmailPage,
        page: () => CreateEmailPage(),
        transition: Transition.fadeIn),
   GetPage(
        name: Paths.EventTitle,
        page: () => EventTitle(),
        transition: Transition.fadeIn),
    GetPage(
        name: Paths.ShowDetailPage,
        page: () => ShowDetailPage(),
        transition: Transition.fadeIn),
  
  ];
}