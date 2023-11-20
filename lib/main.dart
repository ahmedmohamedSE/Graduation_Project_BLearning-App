import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mylearning/StartAndSplash/splash.dart';
import 'dart:ui';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLearning System App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HTML5CourseALLLectures(),
      home: MyCustomSplashScreen(),
    );
  }
}
