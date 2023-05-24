import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_wizard/core/theme/colors.dart';
import 'package:weather_wizard/presentation/screens/main_screen/main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  double screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {

    jumpToEnd(){
      _controller.animateToPage(
        2,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    return Scaffold(
      body: Container(
        color: AppColors.periwinkleBold,
        child: Stack(children: [
          Positioned(
            top: 50,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: screenWidth,
              child:
              GestureDetector(
                onTap: () {
                  print('hey');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          height: 270,
                          child: Lottie.network(
                              "https://assets1.lottiefiles.com/temp/lf20_Jj2Qzq.json")),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Welcome to Weather Wizard !",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "We help you know how's the weather anywhere and everywhere around the world.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ]),
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 270,
                        child: Image.asset(
                          "assets/icons/season_changed.png",
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Get ready to go",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Get accurate weather forecasts for your location and plan your day accordingly. From rain or shine to snow or heatwaves, we've got you covered.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ]),
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 270,
                        child: Image.asset(
                          "assets/icons/umbrella.png",
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Explore the world's weather",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Pick any city in the world and we'll get you the weather with a simple magic trick ;)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ]),
              ),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.67),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  dotColor: Colors.white,
                  dotHeight: 10,
                  dotWidth: 15,
                ),
              )),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: onLastPage ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: onLastPage ? 56.0 : 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(250, 56),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(
                          "/main_screen",
                        );
                      },
                      child: Text(
                        "What's the weather ?",
                        style: TextStyle(
                          color: AppColors.periwinkleBold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          // Visibility(
          //   visible: onLastPage,
          //   child: Positioned(
          //     bottom: 20,
          //     left: 0,
          //    right: 0,
          //    child: Row(
          //      mainAxisAlignment: MainAxisAlignment.center,
          //      children: [
          //        ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.white,
          //             minimumSize: Size(200, 56),
          //             padding: EdgeInsets.symmetric(horizontal: 16),
          //             shape: const RoundedRectangleBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(15)),
          //             ),
          //         ),
          //         onPressed: () { },
          //         child: Text(
          //             "What's the weather ?",
          //           style: TextStyle(
          //             color: AppColors.periwinkleBold,
          //             fontSize: 20
          //           ),
          //         ),
          //       ),
          //      ],
          //    )
          //   ),
          // )
        ]),
      ),
    );
  }
}
