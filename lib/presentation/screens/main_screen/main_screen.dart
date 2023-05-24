import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_wizard/core/theme/colors.dart';
import '../../../core/utils/screen_utils.dart';
import '../../widgets/waiter_message.dart';
import '../../widgets/weather_loader.dart';
import '../../widgets/weather_report.dart';
import 'main_controller.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grape,
        title: Center(
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "WeatherWizard",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Image.asset("assets/images/logo.png", height: 46,),
                ],
              )
        ),
      ),
      body: Obx(
        () {
          final mainScreenState = controller.getMainScreenState;

          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.periwinkleBold,
                      AppColors.periwinkleLight,
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 1700),
                curve: Curves.elasticOut,
                top: mainScreenState.isLoading
                    ? ScreenUtil.screenHeight * 0.35
                    : ScreenUtil.screenHeight * 0.67,
                left: 0.0,
                right: 0.0,
                child: Column(
                    children: [
                      WaiterMessage(mainScreenState: mainScreenState),
                      const SizedBox(height: 15),
                      WeatherLoader(controller: controller, mainScreenState: mainScreenState)
                ]),
              ),
              AnimatedOpacity(
                  opacity: !mainScreenState.isLoading ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child:
                  Container(
                    height: ScreenUtil.screenHeight * .75,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: ScreenUtil.screenWidth,
                          child: Center(
                              child: Text(
                                  DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // color:Colors.red,
                          child: WeatherReport(mainScreenState: mainScreenState),
                        )
                      ],
                    ),
                  )
              )
            ],
          );
        },
      ),
    );
  }
}




