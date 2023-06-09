import 'dart:math';

import 'package:flutter/material.dart';

class Player extends StatelessWidget {

  String Direction;
  bool MouthClosed;

  Player({super.key,required this.Direction,required this.MouthClosed});

  @override
  Widget build(BuildContext context) {

    if (Direction == "Right") {

    return Padding(padding: EdgeInsets.all(4),child: !MouthClosed ? Image.asset("Images/Pacman.png") : Padding(padding: EdgeInsets.all(4),child: Container(decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),),));

    } else if (Direction == "Left") {

    return Transform.rotate(angle: pi,child: !MouthClosed ? Image.asset("Images/Pacman.png") : Padding(padding: EdgeInsets.all(4),child: Container(decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),),));

    } else if (Direction == "Up") {

    return Transform.rotate(angle: 3 * pi / 2, child: !MouthClosed ? Image.asset("Images/Pacman.png"): Padding(padding: EdgeInsets.all(4),child: Container(decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),),));

    } else {

    return Transform.rotate(angle: pi / 2, child: ! MouthClosed ? Image.asset("Images/Pacman.png"): Padding(padding: EdgeInsets.all(4),child: Container(decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),),));

    }
  }
}
   