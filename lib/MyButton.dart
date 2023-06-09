import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final function;
  final text;
  final BGColor;
  final TxtColor;

  const MyButton({super.key,required this.function,required this.text,required this.BGColor,required this.TxtColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: function,child: Container(width: 142,height: 56,
    decoration: BoxDecoration(color: BGColor,borderRadius: BorderRadius.circular(12),),
    child: Center(child: Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: TxtColor),)),
    ),);
  }
}