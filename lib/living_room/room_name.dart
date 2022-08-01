import 'package:flutter/material.dart';

class RoomName extends StatelessWidget {
  final screenWidth, screenHeight, color, roomName;

  const RoomName(
      {Key ?key, this.screenWidth, this.screenHeight, this.color, this.roomName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.15,
      width: screenWidth,
      child: Center(
        child: Transform.rotate(
          angle: -1.58,
          child: Text(
            roomName.toString().toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26),
          ),
        ),
      ),
    );
  }
}
