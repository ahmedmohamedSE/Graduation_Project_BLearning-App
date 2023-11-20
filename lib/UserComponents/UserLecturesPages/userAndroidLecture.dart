import 'package:flutter/material.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'dart:async';

import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';

//!Android Course All Lectures
class AndroidCourseALLLectures extends StatefulWidget {
  const AndroidCourseALLLectures({super.key});

  @override
  State<AndroidCourseALLLectures> createState() =>
      _AndroidCourseALLLecturesState();
}

class _AndroidCourseALLLecturesState extends State<AndroidCourseALLLectures>
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
                                "assets/courses_icons/android-studio.png"),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Android Studio\nDevelopment",
                            // textScaleFactor: 1.2,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "15 Lectures for study",
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
                cards("Lecture 1", "Android Installation"),
                cards("Lecture 2", "Android Introduction"),
                cards("Lecture 3", "Android Architecture"),
                cards("Lecture 4", "AndroidManifest.xml"),
                cards("Lecture 5", "Android Main Widgets"),
                cards("Lecture 6", "Activity and Intents"),
                cards("Lecture 7", "Android Fragments"),
                cards("Lecture 8", "Android Menu"),
                cards("Lecture 9", "Android Services"),
                cards("Lecture 10", "Android AlarmManager"),
                cards("Lecture 11", "Android Storage"),
                cards("Lecture 12", "Android SQLite"),
                cards("Lecture 13", "XML and JSON"),
                cards("Lecture 14", "Android Multimedia"),
                cards("Lecture 15", "Android Animation"),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyNotifications(),
                ));
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.all(_w / 20),
            height: _w / 4.6,
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
                          "assets/courses_icons/android-studio.png")),
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

//!Android Course Lecture1
class AndroidCourseLecture1 extends StatelessWidget {
  const AndroidCourseLecture1({super.key});

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
class AndroidCourseLecture2 extends StatelessWidget {
  const AndroidCourseLecture2({super.key});

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
class AndroidCourseLecture3 extends StatelessWidget {
  const AndroidCourseLecture3({super.key});

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
class AndroidCourseLecture4 extends StatelessWidget {
  const AndroidCourseLecture4({super.key});

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
class AndroidCourseLecture5 extends StatelessWidget {
  const AndroidCourseLecture5({super.key});

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
class AndroidCourseLecture6 extends StatelessWidget {
  const AndroidCourseLecture6({super.key});

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


