// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:organizer/utils/color.dart';
// import 'package:organizer/utils/customText.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CustomText(
//           title: "Log in",
//           color: blackColor,
//           size: Get.size.height * 0.026,
//           fontWeight: FontWeight.w900,
//         ),
//         backgroundColor: backgroundColor,
//         elevation: 5,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: blackColor,
//             )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/screen/home/ticket_widgets/past.dart';
import 'package:organizer/screen/home/ticket_widgets/live.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

import 'ticket_widgets/draft.dart';

class Home extends StatefulWidget {
  String email;
   Home({super.key,required this.email});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Paths.EventTitle);
              },
              child: Icon(Icons.add),
              backgroundColor: primeryColor,
            ),
            drawer: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.size.width * 0.04,
                        vertical: Get.size.height * 0.01),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          minRadius: Get.size.height * 0.03,
                          child: Icon(
                            Icons.home_work,
                            color: greyColor,
                          ),
                        ),
                        MySize(
                          height: 0,
                          width: 0.04,
                        ),
                        CustomText(
                            title: "Yefry Flores",
                            color: Colors.black54,
                            size: Get.size.height * 0.02),
                      ],
                    ),
                  ),  MySize(height: 0.015, width: 0),
                  _drawerItem("Events", Icons.calendar_month_outlined),
                  MySize(height: 0.015, width: 0),
                  _drawerItem("Search Orders", Icons.delete_rounded),
                    MySize(height: 0.015, width: 0),
                  _drawerItem("Switch Organization", Icons.published_with_changes_rounded),
                   MySize(height: 0.015, width: 0),
                  Divider(thickness: 1.4,),
                    MySize(height: 0.015, width: 0),
                  _drawerItem("Device Setting", Icons.settings),
                    MySize(height: 0.015, width: 0),
                  _drawerItem("Feedback", Icons.sms),

                    Divider(thickness: 1.4,),

                    Padding(
                     padding: EdgeInsets.symmetric(
          horizontal: Get.size.width * 0.04, vertical: Get.size.height * 0.01),
                      child: CustomText(title: widget.email,size: Get.size.height*0.019,),
                    ),
                     _drawerItem("Log Out", Icons.logout_sharp),


                ],
              ),
            ),
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: CustomText(
                title: "Events",
                color: blackColor,
                size: Get.size.height * 0.026,
                fontWeight: FontWeight.w900,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        // Get.toNamed(Paths.FiltersPage);
                      },
                      icon: Icon(
                        Icons.search,
                        color: blackColor,
                      )),
                )
              ],
              leading: Builder(
                builder: (context) => IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: blackColor,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer()),
              ),
              bottom: TabBar(
                  labelColor: blackColor,
                  indicatorColor: blackColor,
                  indicatorWeight: 2,
                  tabs: const [
                    Tab(
                      text: "Live",
                    ),
                    Tab(
                      text: "Past",
                    ),
                    Tab(
                      text: "Draft",
                    ),
                  ]),
              backgroundColor: backgroundColor,
              elevation: 0,
            ),
            body: TabBarView(children: [Live(), Past(), Draft()])),
      ),
    );
  }

  Widget _drawerItem(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Get.size.width * 0.04, vertical: Get.size.height * 0.01),
      child: Row(
        children: [
          Icon(
              icon,
              color: greyColor,
              size: Get.size.height*0.035,
            ),
          MySize(
            height: 0,
            width: 0.04,
          ),
          CustomText(
              title: title,
              color: Colors.black54,
              size: Get.size.height * 0.02),
        ],
      ),
    );
  }

}
