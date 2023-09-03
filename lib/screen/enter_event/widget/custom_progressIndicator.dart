
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:organizer/screen/enter_event/controller/controller.dart';
import 'package:organizer/utils/color.dart';
import 'package:organizer/utils/sizedbox.dart';

class IntroScreenOnboarding extends StatefulWidget {
  final List<Introduction>? introductionList;
  final Color? backgroudColor;
  final Color? foregroundColor;
  final TextStyle? skipTextStyle;

  /// Callback on Skip Button Pressed
  final Function()? onTapSkipButton;
  IntroScreenOnboarding({
    Key? key,
    this.introductionList,
    this.backgroudColor,
    this.foregroundColor,
    this.onTapSkipButton,
    this.skipTextStyle = const TextStyle(fontSize: 20),
  }) : super(key: key);

  @override
  _IntroScreenOnboardingState createState() => _IntroScreenOnboardingState();
}

class _IntroScreenOnboardingState extends State<IntroScreenOnboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double progressPercent = 0;
    final controller = Get.put(EnterEventControler());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          // color: widget.backgroudColor ?? Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    height: 550.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: widget.introductionList!,
                    ),
                  ),
                ),
                _customProgress(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customProgress() {
    return Padding(
      padding: EdgeInsets.only(right: Get.size.width * 0.05),
      child:controller.textController.value.text.isEmpty?Container(): Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: Get.size.width * 0.2,
            height: Get.size.height * 0.09,
            child: CircularProgressIndicator(
              color: primeryColor,
              backgroundColor: Colors.white,
              // foregroundColor:
              //     widget.foregroundColor ?? Theme.of(context).primaryColor,
              value:
                  ((_currentPage + 1) * 1.0 / widget.introductionList!.length),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: Get.size.width*0.04,bottom: Get.size.width*0.04),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                _currentPage != widget.introductionList!.length - 1
                    ? _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      )
                    : widget.onTapSkipButton!();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: Get.size.height * 0.04,
                color: blackColor,
              ),
              iconSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

class Introduction extends StatefulWidget {
  Widget? title;
  final Widget? subTitle;
  final double? imageWidth;
  final double? imageHeight;

  Introduction({
    required this.title,
    this.subTitle,
    this.imageWidth = 360,
    this.imageHeight = 360,
  });

  @override
  State<StatefulWidget> createState() {
    return IntroductionState();
  }
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.size.width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title as Widget,
          MySize(height: 0.02, width: 0),
          widget.subTitle as Widget
        ],
      ),
    );
  }
}
