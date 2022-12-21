import 'package:estudos_flutter/meteors.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';
import 'dart:async';
import 'plane.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double planeYaxis = 0;
  static double planeXaxis = 0;
  double time = 0;
  double width = 0;
  double initialWidth = planeXaxis;
  double height = 0;
  double initialHeight = planeYaxis;

  void right() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      time += 0.03;
      width = -3 * time * time + 3 * time;
      setState(() {
        planeXaxis = width - initialWidth;
      });
      if (planeXaxis < 0) {
        timer.cancel();
        time = 0;
        width = 0;
        planeXaxis = 0;
      }
    });
  }

  void left() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      time += 0.03;
      width = -3 * time * time + 3 * time;
      setState(() {
        planeXaxis = initialWidth - width;
      });
      if (planeXaxis > 0) {
        timer.cancel();
        time = 0;
        width = 0;
        planeXaxis = 0;
      }
    });
  }

  void jump() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      time += 0.03;
      height = -3 * time * time + 2.5 * time;
      setState(() {
        planeYaxis = initialHeight - height;
      });
      if (planeYaxis > 0) {
        timer.cancel();
        time = 0;
        height = 0;
        planeYaxis = 0;
      }
    });
  }

  void down() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      time += 0.03;
      height = -3 * time * time + 2.5 * time;
      setState(() {
        planeYaxis = height - initialHeight;
      });
      if (planeYaxis < 0) {
        timer.cancel();
        time = 0;
        height = 0;
        planeYaxis = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swipe(
          onSwipeUp: jump,
          onSwipeDown: down,
          onSwipeLeft: left,
          onSwipeRight: right,
          verticalMaxWidthThreshold: 50,
          verticalMinDisplacement: 10,
          verticalMinVelocity: 30,
          horizontalMaxHeightThreshold: 50,
          horizontalMinDisplacement: 10,
          horizontalMinVelocity: 30,
          child: Container(
            color: Colors.red.shade900,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        alignment: Alignment(planeXaxis, planeYaxis),
                        duration: Duration(milliseconds: 0),
                        child: MyPlane(),
                      ),
                      Meteors(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
