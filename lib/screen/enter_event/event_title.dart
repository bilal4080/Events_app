// ignore_for_file: use_key_in_widget_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:organizer/component/custom_textfield.dart';
import 'package:organizer/routes/app_page.dart';
import 'package:organizer/screen/enter_event/controller/controller.dart';
import 'package:organizer/screen/enter_event/widget/custom_progressIndicator.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/customText.dart';
import 'package:organizer/utils/sizedbox.dart';

class EventTitle extends StatefulWidget {
  // EventTitle({super.key});

  @override
  State<EventTitle> createState() => _EventTitleState();
}

class _EventTitleState extends State<EventTitle> {
  bool isValidate = false;
  bool isEnter = false;
  final key = GlobalKey<FormState>();
  final controller = Get.put(EnterEventControler());

  String name = '';
  var fromDate = "";
  var toDate = '';
  var toTime = "";
  var fromTime = "";
  String dropdownValue = 'Venue';

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> toDateShow() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        toTime = result.format(context);
      });
    }
  }

  Future<void> fromDateShow() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        fromTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
          title: CustomText(
            textAlign: TextAlign.center,
            // overflow: TextOverflow.clip,
            title: "Give your event a title.",
            size: Get.size.height * 0.04,
            fontWeight: FontWeight.w900,
            color: blackColor,
          ),
          subTitle: TextFormField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            style: TextStyle(
                fontSize: Get.size.height * 0.03, fontWeight: FontWeight.bold),
            controller: controller.textController.value,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter a shart distinct name",
              hintStyle: TextStyle(
                  fontSize: Get.size.height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: greyColor),
            ),
          )),
      Introduction(
          title: CustomText(
            textAlign: TextAlign.center,
            // overflow: TextOverflow.clip,
            title: "Describe your event.",
            size: Get.size.height * 0.04,
            fontWeight: FontWeight.w900,
            color: blackColor,
          ),
          subTitle: TextFormField(
            style: TextStyle(
                fontSize: Get.size.height * 0.03, fontWeight: FontWeight.bold),
            controller: controller.describeEvent.value,
            maxLines: 3,
            maxLength: 140,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText:
                  "Enter a brief summary of your event so guests know what to expect",
              hintStyle: TextStyle(
                  fontSize: Get.size.height * 0.03,
                  fontWeight: FontWeight.bold,
                  color: greyColor),
            ),
          )),
      Introduction(
          title: Padding(
            padding: EdgeInsets.only(bottom: Get.size.height * 0.04),
            child: CustomText(
              // textAlign: TextAlign.center,
              title: "Set the date of your event.",
              size: Get.size.height * 0.04,
              fontWeight: FontWeight.w900,
              color: blackColor,
            ),
          ),
          subTitle: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  title: "From:",
                  size: Get.size.height * 0.035,
                  fontWeight: FontWeight.w800,
                  color: blackColor,
                ),
                MySize(height: 0.03, width: 0),
                Row(
                  children: [
                    _FromdatePicker(
                      context,
                    ),
                    MySize(height: 0, width: 0.03),
                    _verticalDivider(),
                    MySize(height: 0, width: 0.03),
                    _FromtimePicker(
                      context,
                    ),
                  ],
                ),
                MySize(height: 0.05, width: 0),
                CustomText(
                  textAlign: TextAlign.center,
                  title: "To:",
                  size: Get.size.height * 0.035,
                  fontWeight: FontWeight.w800,
                  color: blackColor,
                ),
                MySize(height: 0.04, width: 0),
                Row(
                  children: [
                    _todatePicker(context),
                    MySize(height: 0, width: 0.03),
                    _verticalDivider(),
                    MySize(height: 0, width: 0.03),
                    _toTimePicker(
                      context,
                    ),
                  ],
                )
              ],
            ),
          )),
      Introduction(
          title: Column(
            children: [
              MySize(height: 0.02, width: 0),
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
              CustomTextField(
                readOnly: false,
                isfilled: false,
                textAlign: TextAlign.start,
                hint: "Search for a location",
              ),
              MySize(height: 0.03, width: 0),
            ],
          ),
          subTitle: Container(
            decoration: BoxDecoration(
              border: Border.all(color: greyColor, width: 1.2),
              borderRadius: BorderRadius.circular(4),
            ),
            height: Get.size.height * 0.1,
            width: Get.size.width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add,
                      color: greyColor, size: Get.size.height * 0.04),
                  MySize(height: 0, width: 0.02),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Can't find what your're looking for ?",
                          fontWeight: FontWeight.w500,
                          size: Get.size.height * 0.02,
                        ),
                        MySize(height: 0.01, width: 0),
                        CustomText(
                          title: "Add a new venue or address",
                          size: Get.size.height * 0.016,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
    ];
// _selectedTime != null ? _selectedTime!
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: IntroScreenOnboarding(
              introductionList: list,
              onTapSkipButton: () {
                Get.toNamed(Paths.ShowDetailPage);
              })),
    );
  }

  Container _verticalDivider() {
    return Container(
      height: Get.size.height * 0.05,
      child: VerticalDivider(thickness: 1.3),
    );
  }

  InkWell _todatePicker(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        // for date
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          print(
              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
          String formattedDate = DateFormat('Md').format(
              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
          print(
              formattedDate); //formatted date output using intl package =>  2022-07-04
          //You can format date as per your need

          setState(() {
            toDate = formattedDate; //set foratted date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      child: Row(
        children: [
          Icon(Icons.calendar_month_outlined),
          MySize(height: 0, width: 0.04),
          toDate.isNotEmpty
              ? CustomText(
                  textAlign: TextAlign.center,
                  title: toDate,
                  size: Get.size.height * 0.035,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                )
              : CustomText(
                  textAlign: TextAlign.center,
                  title: "Day",
                  size: Get.size.height * 0.035,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                ),
        ],
      ),
    );
  }

  InkWell _FromdatePicker(
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        // for date
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          print(
              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
          String formattedDate = DateFormat('Md').format(
              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
          print(
              formattedDate); //formatted date output using intl package =>  2022-07-04
          //You can format date as per your need

          setState(() {
            fromDate = formattedDate; //set foratted date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
      child: Row(
        children: [
          Icon(Icons.calendar_month_outlined),
          MySize(height: 0, width: 0.04),
          fromDate.isNotEmpty
              ? CustomText(
                  textAlign: TextAlign.center,
                  title: fromDate,
                  size: Get.size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                )
              : CustomText(
                  textAlign: TextAlign.center,
                  title: "Day",
                  size: Get.size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                ),
        ],
      ),
    );
  }

  // _selectedTime != null ? _selectedTime! : 'No time selected!',
  InkWell _FromtimePicker(BuildContext context) {
    return InkWell(
      onTap: fromDateShow,
      child: Row(
        children: [
          const Icon(Icons.watch_later_outlined),
          MySize(height: 0, width: 0.04),
          fromTime.isNotEmpty
              ? CustomText(
                  textAlign: TextAlign.center,
                  // title:  _selectedTime!,
                  title: fromTime,
                  size: Get.size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                )
              : CustomText(
                  textAlign: TextAlign.center,
                  title: "Day",
                  size: Get.size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                ),
        ],
      ),
    );
  }

  InkWell _toTimePicker(BuildContext context) {
    return InkWell(
      onTap: toDateShow,
      child: Row(
        children: [
          const Icon(Icons.watch_later_outlined),
          MySize(height: 0, width: 0.04),
          toTime.isNotEmpty
              ? CustomText(
                  textAlign: TextAlign.center,
                  // title:  _selectedTime!,
                  title: toTime,
                  size: Get.size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                )
              : CustomText(
                  textAlign: TextAlign.center,
                  title: "Day",
                  size: Get.size.height * 0.03,
                  fontWeight: FontWeight.w900,
                  color: blackColor,
                ),
        ],
      ),
    );
  }
}
