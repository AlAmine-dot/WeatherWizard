import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

import '../../core/theme/colors.dart';
import '../../core/utils/screen_utils.dart';
import '../screens/main_screen/main_controller.dart';
import '../screens/main_screen/main_state.dart';

class WeatherLoader extends StatelessWidget {
  const WeatherLoader({
    super.key,
    required this.controller,
    required this.mainScreenState,
  });

  final MainScreenController controller;
  final MainScreenState mainScreenState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: ScreenUtil.screenHeight * .09,
      child: GestureDetector(
        onTap: (){
          controller.restartProcess();
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: LiquidLinearProgressIndicator(
            key: Key(mainScreenState.loadLevel.toString()), // Key pour forcer l'animation lors du changement de valeur
            value: mainScreenState.loadLevel,
            valueColor: AlwaysStoppedAnimation(AppColors.grape),
            backgroundColor: Colors.white,
            borderColor: AppColors.periwinkleBold,
            borderWidth: 1.6,
            borderRadius: 12.0,
            direction: Axis.horizontal,
            center: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Text(
                mainScreenState.loaderText,
                key: Key(mainScreenState.loaderText), // Assurez-vous de fournir une clé unique pour chaque changement de texte
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.periwinkleLight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}