import 'package:flutter/material.dart';

class LampSwitchRope extends StatelessWidget {
  final screenWidth, screenHeight, color, isSwitchOn, animationDuration;

  const LampSwitchRope({
    Key ?key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.color,
    @required this.isSwitchOn,
    @required this.animationDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      bottom: screenHeight * (isSwitchOn ? 0.36 : 0.40),
      top: screenHeight * 0.4,
      right: screenWidth * 0.5 - 1,
      width: 2,
      child: Container(
        color: color,
      ),
    );
  }
}
