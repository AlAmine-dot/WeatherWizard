import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/screen_utils.dart';
import '../screens/main_screen/main_state.dart';

class WeatherReport extends StatelessWidget {
  const WeatherReport({
    super.key,
    required this.mainScreenState,
  });

  final MainScreenState mainScreenState;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil.screenHeight * .6,
        width: ScreenUtil.screenWidth,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mainScreenState.dailyForecasts.length,
            itemBuilder: (context, index) {
              var item = mainScreenState.dailyForecasts[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  item.cityname,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                              ),
                              Text(
                                  item.forecast.first.description,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkBlue
                                  )
                              )
                            ],
                          )
                      ),
                      Expanded(
                          child: Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${item.forecast.first.temperature}°",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                    width: 70,
                                    child: item.forecast.first.lottieResource != null ?
                                    Lottie.network(
                                        "${item.forecast.first.lottieResource}")
                                        :
                                    // Image.asset("assets/openmeteoicons/${item.forecast.first.icon}.png")
                                    Text("${item.forecast.first.icon}")
                                )
                              ],
                            ),
                          )
                      ),
                    ]),
              );
            }
        )

    );
  }
}
