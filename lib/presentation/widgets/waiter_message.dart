import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/screen_utils.dart';
import '../screens/main_screen/main_state.dart';

class WaiterMessage extends StatelessWidget {
  const WaiterMessage({
    super.key,
    required this.mainScreenState,
  });

  final MainScreenState mainScreenState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: ScreenUtil.screenHeight * .075,
      child: Center(
        child: AnimatedOpacity(
          opacity: mainScreenState.isWaiterMessageVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: ScreenUtil.screenHeight * .075,
            child: Center(
              child: Text(
                mainScreenState.waiterMessage,
                style: GoogleFonts.comfortaa(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                    height: 1.3
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
