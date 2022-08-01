import 'package:flutter/material.dart';

class LampSwitch extends StatelessWidget {
  final screenWidth,
      screenHeight,
      toggleOnColor,
      toggleOffColor,
      color,
      isSwitchOn,
      onTap;
  final Duration animationDuration = const Duration(milliseconds: 500);

  const LampSwitch({
    Key ?key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.toggleOnColor,
    @required this.toggleOffColor,
    @required this.color,
    @required this.isSwitchOn,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.34,
      left: screenWidth * 0.5 - 15,
      width: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: animationDuration,
              width: 30,
              height: 60,
              decoration: BoxDecoration(
                  color: isSwitchOn ? toggleOnColor : toggleOffColor,
                  borderRadius: BorderRadius.circular(15)),
            ),
            AnimatedPositioned(
                left: 0,
                right: 0,
                top: isSwitchOn ? 32 : 4,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                ),
                duration: animationDuration),
          ],
        ),
      ),
    );
  }
}
