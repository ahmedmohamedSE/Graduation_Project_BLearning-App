import 'package:flutter/material.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'dart:async';

import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';

//!HTML5 Course All Lectures
class HTML5CourseALLLectures extends StatefulWidget {
  const HTML5CourseALLLectures({super.key});

  @override
  State<HTML5CourseALLLectures> createState() =>
      _HTML5CourseALLLecturesState();
}

class _HTML5CourseALLLecturesState extends State<HTML5CourseALLLectures>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  Animation<double>? _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
             Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Course Lectures Page',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black, size: 30),
              onPressed: () {
                setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      //!Home Taps
                      MaterialPageRoute(builder: (_) => MyNotifications()),
                      (Route<dynamic> route) => false);
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          //!هنا الشغل
          onPressed: () {},
          child: Icon(
            Icons.mic,
            color: Colors.blue,
            size: 35,
          ),
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(_w / 20),
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 108, 185, 248),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/courses_icons/html5.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HTML5 Pogramming\nLanguage",
                            // textScaleFactor: 1.2,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "25 free Lectures",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            "Start Now",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: _w / 13),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Show All Course Lectures",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: _w / 13),
                cards("Lecture 1", "HTML5 Installation"),
                cards("Lecture 2", "HTML5 Introduction"),
                cards("Lecture 3", "HTML Text Editors"),
                cards("Lecture 4", "HTML5 Tags and\nBuilding blocks"),
                cards("Lecture 5", "HTML Elements"),
                cards("Lecture 6", "HTML Attributes"),
                cards("Lecture 7", "HTML Formatting"),
                cards("Lecture 8", "HTML Heading&Paragraph tags"),
                cards("Lecture 9", "HTML Phrase tags & Anchor Links"),
                cards("Lecture 10", "HTML Images"),
                cards("Lecture 11", "HTML Tables & Lists"),
                cards("Lecture 12", "HTML Forms"),
                cards("Lecture 13", "HTML Form Inputs"),
                cards("Lecture 14", "HTML5 with CSS3"),
                cards("Lecture 15", "HTML with Javascript"),
                cards("Lecture 16", "HTML Iframe"),
                cards("Lecture 17", "HTML Entities"),
                cards("Lecture 18", "HTML Responsive"),
                cards("Lecture 19", "HTML URL Encode"),
                cards("Lecture 20", "HTML Global&Event Attributes"),
                cards("Lecture 21", "HTML Advanced topics"),
                cards("Lecture 22", "HTML Semantic tags"),
                cards("Lecture 23", "HTML Audio&Videos"),
                cards("Lecture 24", "HTML Google Maps"),
                cards("Lecture 25", "HTML APIs"),
              ],
            ),

            // top me rahna
            // CustomPaint(
            //   painter: MyPainter(),
            //   child: Container(height: 0),
            // ),
          ],
        ),
      ),
    );
  }

  Widget cards(String title, String subtitle) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation!.value,
      child: Transform.translate(
        offset: Offset(0, _animation2!.value),
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => MyNotifications(),
            //     ));
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(_w / 20),
            height: 110,
            width: _w,
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 223, 223, 223),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.withOpacity(.1),
                  radius: _w / 15,
                  child: Image(
                      image: AssetImage(
                          "assets/courses_icons/html5.png")),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: _w / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textScaleFactor: 1.6,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.7),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // Text(
                      //   "Start to Learn",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w400,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Icon(Icons.navigate_next_outlined, size: 55)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//!HTML5 Course Lecture1
class HTML5CourseLecture1 extends StatelessWidget {
  const HTML5CourseLecture1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Lecture 1",
            style: TextStyle(fontSize: 33),
          ),
        ),
      ),
    );
  }
}

//!Android Course Lecture2
class HTML5CourseLecture2 extends StatelessWidget {
  const HTML5CourseLecture2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Lecture 2",
            style: TextStyle(fontSize: 33),
          ),
        ),
      ),
    );
  }
}

//!Android Course Lecture3
class HTML5CourseLecture3 extends StatelessWidget {
  const HTML5CourseLecture3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Lecture 3",
            style: TextStyle(fontSize: 33),
          ),
        ),
      ),
    );
  }
}

//!Android Course Lecture4
class HTML5CourseLecture4 extends StatelessWidget {
  const HTML5CourseLecture4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Lecture 4",
            style: TextStyle(fontSize: 33),
          ),
        ),
      ),
    );
  }
}
//!Android Course Lecture5
class HTML5CourseLecture5 extends StatelessWidget {
  const HTML5CourseLecture5({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Lecture 5",
            style: TextStyle(fontSize: 33),
          ),
        ),
      ),
    );
  }
}

//!Android Course Lecture6
class HTML5CourseLecture6 extends StatelessWidget {
  const HTML5CourseLecture6({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "Lecture 6",
            style: TextStyle(fontSize: 33),
          ),
        ),
      ),
    );
  }
}


