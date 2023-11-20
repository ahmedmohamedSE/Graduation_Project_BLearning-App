import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';

/*
class Lectures {

  int? id;
  int? time;
  String? lecName, subtitle, content;

  // Course_attributes({this.id,this.hours, this.courseName,this.subtitle, this.description, this.image});

  Lectures(dynamic obj) {
    id = obj['id'];
    time = obj['time'];
    lecName = obj['lecName'];
    subtitle = obj['subtitle'];
    content = obj['content'];
  }

  Lectures.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    time = data['lec'];
    lecName = data['lecName'];
    subtitle = data['subtitle'];
    content = data['content'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'time': time,
        'lecName': lecName,
        'subtitle': subtitle,
        'content': content,
      };

  // int? get id => id;
  // int? get time => time;
  // String? get lecName => lecName;
  // String? get subTitle => subtitle;
  // String? get descrip => description;



/*
List<Course_attributes> course = [
  Course_attributes(
    id: 001,
    title: "C# Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/C_sharp.png",
  ),
  Course_attributes(
    id: 002,
    title: "Dart Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/dart.png",
  ),
  Course_attributes(
    id: 003,
    title: "Flutter Tutorials",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/flutter.png",
  ),
  Course_attributes(
    id: 004,
    title: "HTML5 Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/html5.png",
  ),
  Course_attributes(
    id: 005,
    title: "C++ Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/c++.png",
  ),
  Course_attributes(
    id: 006,
    title: "CSS3 Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/css3.png",
  ),
  Course_attributes(
    id: 007,
    title: "JavaScript Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/javascript.png",
  ),
  Course_attributes(
    id: 008,
    title: "Java Programming Language",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/java.png",
  ),
  Course_attributes(
    id: 009,
    title: "Android Tutorials",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/android-studio.png",
  ),
  Course_attributes(
    id: 010,
    title: "AutoDesk Autocade Tutorials",
    description: "dbsvlnfbjv sdvsdfvnsdlm l",
    image: "assets/courses_icons/autodesk-autocad.png",
  ),
];
*/

}
*/
class Lecture {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? content;
  final int? courseId;

  Lecture(
      {this.id,
      required this.title,
      required this.subtitle,
      required this.content,
      required this.courseId});

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'content': content,
        'course_id': courseId,
      };

  static Lecture fromJson(Map<String, Object?> json) => Lecture(
        id: json['id'] as int?,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        content: json['content'] as String,
        courseId: json['course_id'] as int,
      );
}
