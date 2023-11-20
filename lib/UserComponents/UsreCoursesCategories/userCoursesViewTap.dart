import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'dart:ui';
import 'dart:async';


class MyCoursesCategoryTap extends StatefulWidget {
  const MyCoursesCategoryTap({super.key});

  @override
  State<MyCoursesCategoryTap> createState() => _MyCoursesCategoryTapState();
}

class _MyCoursesCategoryTapState extends State<MyCoursesCategoryTap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("Courses Categories")),
      ),
    );
  }
}