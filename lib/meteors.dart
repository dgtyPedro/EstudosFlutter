import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

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
  double screenHeight = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  double screenWidth = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  void move() {
    Timer.periodic(Duration(milliseconds: 10), (timer2) {
      setState(() {
        yAxis = yAxis + yMovement;
        xAxis = xAxis + xMovement;
      });
      if(yAxis > MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height
      || xAxis > screenWidth){
        int genSpawn = random.nextInt(3);
        switch (genSpawn){
          case 0:
            dev.log('0');
            yAxis = 0;
            xAxis = random.nextInt(screenWidth.toInt()).toDouble();
            break;
          case 1:
            dev.log('1');
            yAxis = screenHeight;
            xAxis = random.nextInt(screenWidth.toInt()).toDouble();
            break;
          case 2:
            dev.log('2');
            yAxis = random.nextInt(screenHeight.toInt()).toDouble();
            xAxis = 0;
            break;
          case 3:
            dev.log('3');
            yAxis = random.nextInt(screenHeight.toInt()).toDouble();
            xAxis = screenWidth;
            break;
        }
        if (xAxis < screenWidth/2) {
          dev.log('4');
          xMovement = 5;
        }else{
          dev.log('5');
          xMovement = -5;
        }
        if (yAxis < screenHeight/2) {
          dev.log('6');
          yMovement = 5;
        }else{
          dev.log('7');
          yMovement = -5;
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
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
