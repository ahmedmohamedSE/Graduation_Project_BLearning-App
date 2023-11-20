import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:speech_to_text/speech_to_text.dart';


class MyFAB extends StatefulWidget {
  const MyFAB({super.key});

  @override
  State<MyFAB> createState() => _MyFABState();
}

//لازم الازرار تبقي موحده علي الكل
class _MyFABState extends State<MyFAB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //!هنا الشغل
        onPressed: () {},
        child: Icon(Icons.mic, color: Colors.blue, size: 30),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}