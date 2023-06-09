import 'package:flutter/material.dart';

class Ghost extends StatelessWidget {
  const Ghost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(4),child: Image.asset("Images/Ghost.png"),);
  }
}