import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'dart:ui';
import 'dart:async';

class MyQuizzesCategoryTap extends StatefulWidget {
  const MyQuizzesCategoryTap({super.key});

  @override
  State<MyQuizzesCategoryTap> createState() => _MyQuizzesCategoryTapState();
}

class _MyQuizzesCategoryTapState extends State<MyQuizzesCategoryTap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("Quizzes Categories")),
      ),
    );
  }
}