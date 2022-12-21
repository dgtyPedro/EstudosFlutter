import 'package:flutter/material.dart';
import 'dart:async';
import 'plane.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double planeYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = planeYaxis;
  bool gameHasStarted = false;

  void up() {
    setState(() {
      time = 0;
      initialHeight = planeYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        planeYaxis = initialHeight - height;
      });
      if(planeYaxis > 1){
        timer.cancel();
        gameHasStarted = false;
        time=0;
        planeYaxis = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: (){
                if(gameHasStarted){
                  up();
                }else{
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0, planeYaxis),
                duration: Duration(milliseconds: 0),
                color: Colors.red.shade900,
                child: MyPlane(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.brown.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
