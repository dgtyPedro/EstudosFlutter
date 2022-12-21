import 'package:flutter/material.dart';

class MyPlane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: RotatedBox(
          quarterTurns: 1,
          child: Image.asset(
            'lib/images/ship.png',
            scale: 0.5,
          ),
        ));
  }
}
