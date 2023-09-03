import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/screen/home/home.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class ShowDetailPage extends StatefulWidget {
  const ShowDetailPage({super.key});

  @override
  State<ShowDetailPage> createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  String dropdownValue = 'Venue';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          actions: [
            _customButton(
              Icons.visibility,
              () {
                // Get.toNamed(Paths.FiltersPage);
              },
            ),
            _customButton(
              Icons.check,
              () {
                // Get.toNamed(Paths.FiltersPage);
              },
            ),
            _customButton(
              Icons.upload_outlined,
              () {
                // Get.toNamed(Paths.FiltersPage);
              },
            ),
        PopupMenuButton(
          icon: Icon(Icons.more_vert,color: blackColor,),
  onSelected: (value) {
    // your logic
  },
  itemBuilder: (BuildContext bc) {
    return  [
      PopupMenuItem(
        onTap: (){},
        child:CustomText(title: "Unpublish",color: greyColor,),
        
      ),
      PopupMenuItem(
          onTap: (){},
        child: Text("Cancel Event"),
        
      ),
      PopupMenuItem(
         
        child: InkWell(
          onTap: (){
                 showDialog(context: context, builder: (context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                       MySize(height: 0.03, width: 0),
                    Icon(Icons.delete,size:Get.size.height*0.04),
                       MySize(height: 0.03, width: 0),
                    CustomText(title: "Are you sure you want to \n delete your events?",color: greyColor,heightSpace: 1.3,),
                     MySize(height: 0.03, width: 0),
                  TextButton(onPressed: (){
                  Get.to(Home(email: ""));
                  }, child: CustomText(title: "Delete Event",color: primeryColor),)
                  ],
                ),
              );
            },);
          },
          child: Text("Delete Event")),
        
      )
    ];
  },
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
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MySize(height: 0.06, width: 0),
              Container(
                height: Get.size.height * 0.2,
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: Get.size.height * 0.04,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.size.width*0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          MySize(height: 0.03, width: 0),
                        _row("name", FontWeight.w900, Get.size.height * 0.03,
                            blackColor,
                            icon: Icons.edit_note_outlined),
                        MySize(height: 0.02, width: 0),
                        _row("by Unnanmed organizer", FontWeight.normal,
                            Get.size.height * 0.016, blackColor),
                        MySize(height: 0.03, width: 0),
                        _row(
                            "Testing Teseting hlsjfksaljasdlfasdflkjsaldkjflksadjflkjsdalkfjlk",
                            FontWeight.normal,
                            Get.size.height * 0.016,
                            blackColor),
                        MySize(height: 0.03, width: 0),
                        _row("Event starts", FontWeight.normal,
                            Get.size.height * 0.017, blackColor,
                            icon: Icons.calendar_month_outlined),
                        _row(
                          "show start Date",
                          FontWeight.w500,
                          Get.size.height * 0.017,
                          blackColor,
                        ),
                        MySize(height: 0.015, width: 0),
                        _row(
                          "Event End",
                          FontWeight.normal,
                          Get.size.height * 0.017,
                          blackColor,
                        ),
                        _row(
                          "show end Date",
                          FontWeight.w500,
                          Get.size.height * 0.017,
                          blackColor,
                        ),
                        MySize(height: 0.01, width: 0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.size.width * 0.08),
                          child: DropdownButton<String>(
                            isExpanded: false,
                            // Step 3.
                            value: dropdownValue,
                            // Step 4.
                            items: <String>[
                              'Venue',
                              'Online event',
                              'To be announced',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: CustomText(
                                  title: value,
                                  size: Get.size.height * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                        MySize(height: 0.023, width: 0),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: Get.size.height * 0.04),
                            MySize(height: 0, width: 0.04),
                            DropdownButton<String>(
                              isExpanded: false,
                              // Step 3.
                              value: dropdownValue,
                              // Step 4.
                              items: <String>[
                                'Venue',
                                'Online event',
                                'To be announced',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: CustomText(
                                    title: value,
                                    size: Get.size.height * 0.02,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              }).toList(),
                              // Step 5.
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            )
                          ],
                        ),
                      
                        MySize(height: 0.03, width: 0),
                        _row("Event type", FontWeight.w500,
                            Get.size.height * 0.017, blackColor,
                            icon: Icons.book_online),
                              MySize(height: 0.01, width: 0),
                              _row("Select type", FontWeight.normal,
                            Get.size.height * 0.017, blackColor,
                          ),
                         MySize(height: 0.03, width: 0),
                        _row("Privacy", FontWeight.w500,
                            Get.size.height * 0.017, blackColor,
                            icon: Icons.lock_outline),
                              MySize(height: 0.01, width: 0),
                              _row("Public event", FontWeight.normal,
                            Get.size.height * 0.017, blackColor,
                          ),
                            MySize(height: 0.03, width: 0),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Row _row(
      String title, FontWeight fontWaight, double textsize, Color textColor,
      {IconData? icon}) {
    return Row(
      children: [
        Icon(icon),
        MySize(height: 0, width: 0.04),
        CustomText(
          boxConstraints: BoxConstraints(maxWidth: Get.size.width * 0.6),
          title: title,
          maxline: 5,
          textAlign: TextAlign.justify,
          fontWeight: fontWaight,
          size: textsize,
          latterSpace: 0.4,
          color: textColor,
        )
      ],
    );
  }

  Padding _customButton(IconData icon, Function() ontap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: ontap,
          icon: Icon(
            icon,
            color: blackColor,
          )),
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
