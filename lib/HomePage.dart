import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pacman_final_version/Barrier.dart';
import 'package:pacman_final_version/Ghost.dart';
import 'package:pacman_final_version/MyButton.dart';
import 'package:pacman_final_version/Path.dart';
import 'package:pacman_final_version/Player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Game Variables
  Timer? timer;
  Timer? timer2;
  bool HasStarted = false;
  int Score = 0;

  // Grid Variables
  static int NumberofRows = 11;
  int NumberofSquares = NumberofRows * 17;
  List<int> Barriers = [0,1,2,3,4,5,6,7,8,9,10,11,22,33,44,55,66,77,99,110,121,132,
  143,154,165,176,177,178,179,180,181,182,183,184,185,186,175,164,153,142,131,120,
  109,87,76,65,54,43,32,21,78,79,80,100,101,102,84,85,86,106,107,108,24,35,46,57,30,
  41,52,63,81,70,59,61,72,83,26,28,37,38,39,123,134,145,156,129,140,151,162,103,114,
  125,105,116,127,147,148,149,158,160];
  List<int> Foods = [];

  // Player Variables
  int PlayerPos = NumberofRows * 15 + 1;
  String PlayerDirecion = "Right";
  bool MouthClosed = false;

  // Ghost Variables
  String GhostDirection = "Left";
  int GhostPos = 20;



  void StartGame() {
  AddFoods();
  MoveGhost();
  timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
  NavigateDirection();
  MoveMouth();
  EatFoods();
  ChangeGhostDirection();
  CheckforDeath();
  });

  }

  void AddFoods() {

  for (var i = 0; i < NumberofSquares; i++) {

  if (!Barriers.contains(i)) {

  Foods.add(i);

  }
  }
  setState(() {
  HasStarted = true;
  });
  }

  void EatFoods() {

  if (Foods.contains(PlayerPos) ) {

  Foods.remove(PlayerPos);
  setState(() {
  Score += 1;
  });
  }

  }

  void MoveMouth() {

  setState(() {
  
  MouthClosed = !MouthClosed;

  });

  }

  void NavigateDirection() {

  switch (PlayerDirecion) {

  case "Left": 

  MoveLeft();

  break;

  case "Right":

  MoveRight();

  break; 

  case "Up":

  MoveUp();

  break;

  case "Down":

  MoveDown();

  break;

  }

  }

  void MoveLeft() {
  if (!Barriers.contains(PlayerPos -1)) {

  setState(() {
  
  PlayerPos -= 1;

  });
  }
  }

  void MoveRight() {

  if (!Barriers.contains(PlayerPos + 1)) {

  setState(() {
  PlayerPos += 1;
  });

  }

  }

  void MoveUp() {

  if (!Barriers.contains(PlayerPos - NumberofRows)) {

  setState(() {

  PlayerPos -= NumberofRows;
  
  });
  }

  }

  void MoveDown() {

  if (!Barriers.contains(PlayerPos + NumberofRows)) {

  setState(() {
  
  PlayerPos += NumberofRows;

  });

  }

  }

  void MoveGhost() {
  timer2 = Timer.periodic(Duration(milliseconds: 300), (timer) {
  
  if (GhostDirection == "Left") {

  setState(() {

  GhostPos -= 1;
  
  });

  } else if (GhostDirection == "Right") {

  setState(() {
  
  GhostPos += 1; 

  });

  } else if (GhostDirection == "Up") {

  setState(() {
  
  GhostPos -= NumberofRows;

  });
 
  } else if (GhostDirection == "Down") {

  setState(() {
  
  GhostPos += NumberofRows;

  });
  }
  });
  }

  void ChangeGhostDirection() {

  if (GhostPos == 12 || GhostPos == 51) {

  setState(() {
  GhostDirection = "Down";
  });

  } else if (GhostPos == 67 || GhostPos == 47 || GhostPos == 73) {

  setState(() {
  
  GhostDirection = "Right";

  });

  } else if (GhostPos == 69 || GhostPos == 75) {

  setState(() {
  
  GhostDirection = "Up";

  });

  } else if (GhostPos == 20) {

  setState(() {
  GhostDirection = "Left";
  });

  }

  }

  void CheckforDeath() {

  if (GhostPos == PlayerPos) {

  GameOver();
  print("Death");

  }

  }

  void GameOver() {
  setState(() {
  timer?.cancel();
  timer2?.cancel();
  });
  showDialog(context: context, builder: (BuildContext context) {

  return AlertDialog(

  backgroundColor: Colors.red,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  content: Container(width: 240,height: 120,child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
  Text("You Have Died Bro. ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
  Text("You Score is ${Score}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
  MyButton(function: ResetGame, text: "Start Again", BGColor: Colors.blue.shade900, TxtColor: Colors.white)
  ],),),

  );

  });

  }

  void ResetGame() {
  Navigator.pop(context);
  setState(() {
  HasStarted = false;
  GhostPos = 20;
  GhostDirection = "Left";
  MouthClosed = false;
  PlayerDirecion = "Right";
  PlayerPos = NumberofRows * 15 + 1;
  Foods = [];
  Score = 0;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    backgroundColor: Colors.black,
    body: Column(children: [

    Expanded(flex: 5,child: GestureDetector(
    onVerticalDragUpdate: (details) {

    if (details.delta.dy > 0) {

    PlayerDirecion = "Down";
    print(PlayerDirecion);

    } else if (details.delta.dy < 0) {

    PlayerDirecion = "Up";
    print(PlayerDirecion);

    }

    }, 
    onHorizontalDragUpdate: (details) {

    if (details.delta.dx > 0) {

    PlayerDirecion = "Right";
    print(PlayerDirecion);

    } else if (details.delta.dx < 0) {

    PlayerDirecion = "Left";
    print(PlayerDirecion);

    }

    },
    child: Container(child: GridView.builder(
    itemCount: NumberofSquares,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: NumberofRows),itemBuilder: (BuildContext context,index) {

    if (Barriers.contains(index)) {

    return Barrier();

    } else if (PlayerPos == index) {

    return Player(Direction: PlayerDirecion,MouthClosed: MouthClosed,);

    } else if (GhostPos == index) {

    return Ghost();

    }  else {

    return !HasStarted ? MyPath() : Foods.contains(index) ? MyPath() : Container();

    }

    }),))),
    Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Text("Score: " + Score.toString(),style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.white),),
    MyButton(function: StartGame, text: "Play Game", BGColor: Colors.white, TxtColor: Colors.blue.shade900)
    ],))

    ],),

    );
  }
}