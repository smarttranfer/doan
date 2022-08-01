import 'package:flutter/material.dart';

class LampHangerRope extends StatelessWidget {
  final screenWidth, screenHeight,color;

  const LampHangerRope(
      {Key ?key, @required this.screenWidth, @required this.screenHeight, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth*0.20,
        child: Container(
          color: color,
          width: 15,
          height: screenHeight * 0.15,
        )
    );
  }
}
