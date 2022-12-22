import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:core';

class Meteors extends StatefulWidget {
  @override
  _MeteorsState createState() => _MeteorsState();
}

class _MeteorsState extends State<Meteors> {
  Random random = Random();
  double yAxis = 100;
  double xAxis = 0;
  double xMovement = 5;
  double yMovement = 5;
  double screenHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  void move() {
    Timer.periodic(Duration(milliseconds: 10), (timer2) {
      setState(() {
        yAxis = yAxis + yMovement;
        xAxis = xAxis + xMovement;
      });
      if (yAxis > screenHeight || xAxis > screenWidth || yAxis < 0 || xAxis < 0) {
        int genSpawn = random.nextInt(4);
        switch (genSpawn) {
          case 0:
            yAxis = 0;
            xAxis = random.nextInt(screenWidth.toInt()).toDouble();
            break;
          case 1:
            yAxis = screenHeight;
            xAxis = random.nextInt(screenWidth.toInt()).toDouble();
            break;
          case 2:
            yAxis = random.nextInt(screenHeight.toInt()).toDouble();
            xAxis = 0;
            break;
          case 3:
            yAxis = random.nextInt(screenHeight.toInt()).toDouble();
            xAxis = screenWidth;
            break;
        }
        if (xAxis < screenWidth / 2) {
          xMovement = random.nextInt(5).toDouble();
        } else {
          xMovement = random.nextInt(5).toDouble() - 6;
        }
        if (yAxis < screenHeight / 2) {
          yMovement = random.nextInt(5).toDouble();
        } else {
          yMovement = random.nextInt(5).toDouble() - 6;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: move,
      child: Stack(
        children: [
          Positioned(
            left: xAxis,
            top: yAxis,
            child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
