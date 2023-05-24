import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_wizard/presentation/bindings/bindings.dart';
import 'package:weather_wizard/presentation/screens/main_screen/main_controller.dart';
import 'package:weather_wizard/presentation/screens/main_screen/main_screen.dart';
import 'package:weather_wizard/presentation/screens/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(const WeatherWizardApp());
}

class WeatherWizardApp extends StatelessWidget {
  const WeatherWizardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: "Weather Wizard",
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => OnboardingScreen()),
        GetPage(name:"/main_screen", page: () => MainScreen(), binding: AppBinding(), transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 500))
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

