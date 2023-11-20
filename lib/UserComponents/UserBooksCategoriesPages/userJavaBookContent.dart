import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:async';
import 'dart:io';
import 'package:animations/animations.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';

//!Book Information
class JavaBookInfo extends StatefulWidget {
  const JavaBookInfo({super.key});

  @override
  State<JavaBookInfo> createState() => _JavaBookInfoState();
}

class _JavaBookInfoState extends State<JavaBookInfo> {
  bool _color = false;
  @override
  Widget build(BuildContext context) {
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
            'Book Information Page',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
            IconButton(
              icon: Icon(Icons.favorite_border,
                  color: _color ? Colors.black : Colors.red, size: 30),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              foregroundDecoration: const BoxDecoration(color: Colors.black26),
              height: 400,
              width: double.infinity,
              child: Image(
                  image: AssetImage("assets/Books_images/Java.jpg"),
                  fit: BoxFit.fill),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Learning Java\nProgramming Language",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.favorite_border, size: 35),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 35),
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 35),
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 35),
                                      Icon(Icons.star_border,
                                          color: Colors.amber, size: 35),
                                      Icon(Icons.star_border,
                                          color: Colors.amber, size: 35),
                                    ],
                                  ),
                                  const Text(
                                    "the papular book",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            //! Navigator to content Page
                            onPressed: () {
                              setState(() {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => JavaBookContent()),
                                    (Route<dynamic> route) => false);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 32.0,
                              ),
                            ),
                            child: const Text(
                              "Start Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Description".toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Our core Java programming tutorial is designed for students and working professionals. Java is an object-oriented, class-based, concurrent, secured and general-purpose computer-programming language. It is a widely used robust technology.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//!Book Content
class JavaBookContent extends StatefulWidget {
  const JavaBookContent({super.key});

  @override
  State<JavaBookContent> createState() => _JavaBookContentState();
}

class _JavaBookContentState extends State<JavaBookContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
               setState(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => JavaBookInfo()),
                      (Route<dynamic> route) => false);
                });
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Book Content Page',
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
                      MaterialPageRoute(builder: (_) => MyNotifications()),
                      (Route<dynamic> route) => false);
                });
              },
            ),
          ],
        ),
        body: Container(child: Center(child: Text("Java Book Content"))),
      ),
    );
  }
}
