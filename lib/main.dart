import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';

void main() {
  
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(

    debugShowCheckedModeBanner: false,
    home: HomePage(),

    );
  }
}