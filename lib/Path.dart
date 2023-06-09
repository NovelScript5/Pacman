import 'package:flutter/material.dart';

class MyPath extends StatelessWidget {
  const MyPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(7),child: Container(padding: EdgeInsets.all(4),child: Container(decoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),),),);
  }
}