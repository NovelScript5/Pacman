import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  const Barrier({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(1),child: Container(padding: EdgeInsets.all(4),decoration: BoxDecoration(color: Colors.blue.shade900,borderRadius: BorderRadius.circular(6)),child: Container(decoration: BoxDecoration(color: Colors.blue.shade500,borderRadius: BorderRadius.circular(24)),),),);
  }
}