import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lamp.dart';
import 'lamp_hanger_rope.dart';
import 'lamp_switch.dart';
import 'lamp_switch_rope.dart';
import 'led_bulb.dart';
import 'room_name.dart';

final darkGray = const Color(0XFF232323);
final bulbOnColor = const Color(0XFFFFE12C);
final bulbOffColor = const Color(0XFFC1C1C1);
final animationDuration = const Duration(milliseconds: 500);

class LivingHomePage extends StatefulWidget {
  @override
  _LivingHomePageState createState() => _LivingHomePageState();
}

class _LivingHomePageState extends State<LivingHomePage> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LampHangerRope(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: darkGray,
          ),
          LEDBulb(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            isSwitchOn: _isSwitchOn,
            onColor: bulbOnColor,
            offColor: bulbOffColor,
          ),
          Lamp(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            gradientColor: bulbOnColor,
            animationDuration: animationDuration,
          ),
          LampSwitch(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            toggleOnColor: bulbOnColor,
            toggleOffColor: bulbOffColor,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            onTap: () {
              setState(() {
                _isSwitchOn = !_isSwitchOn;
              });
            },
          ),
          LampSwitchRope(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: darkGray,
            isSwitchOn: _isSwitchOn,
            animationDuration: animationDuration,
          ),
          RoomName(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            color: darkGray,
            roomName: "Open Lamp",
          ),
        ],
      ),
    );
  }
}
