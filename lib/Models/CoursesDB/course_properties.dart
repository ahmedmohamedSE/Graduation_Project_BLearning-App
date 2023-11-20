// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'dart:io';

/*
class Course_attributes {
  int? id;
  int? hours;
  String? courseName, subtitle, description;
  File? image;

  // Course_attributes({this.id,this.hours, this.courseName,this.subtitle, this.description, this.image});

  Course_attributes(dynamic obj) {
    id = obj['id'];
    hours = obj['hours'];
    courseName = obj['courseName'];
    subtitle = obj['subtitle'];
    description = obj['description'];
    image = obj['image'];
  }

  Course_attributes.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    hours = data['hours'];
    courseName = data['courseName'];
    subtitle = data['subtitle'];
    description = data['description'];
    image = data['image'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'hours': hours,
        'courseName': courseName,
        'subtitle': subtitle,
        'description': description,
        'image': image,
      };

  int? get course_id => id;
  int? get course_hours => hours;
  String? get coursename => courseName;
  String? get subTitle => subtitle;
  String? get descrip => description;
  // String? get imagePath => image;
}


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
*/

class Course {
  final int? id;
  final String title;
  final String subtitle;
  final String image;

  Course({this.id, required this.title, required this.subtitle, required this.image});

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'image': image,
      };

  static Course fromJson(Map<String, Object?> json) => Course(
        id: json['id'] as int?,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String,
        image: json['image'] as String,
      );
}




