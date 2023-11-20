import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:async';
import 'dart:io';
import 'package:animations/animations.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';

//!Book Information
class CSSBookInfo extends StatefulWidget {
  const CSSBookInfo({super.key});

  @override
  State<CSSBookInfo> createState() => _CSSBookInfoState();
}

class _CSSBookInfoState extends State<CSSBookInfo> {
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
                  image: AssetImage("assets/Books_images/CSS.jpg"),
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
                          "Learning CSS Topics",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
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
                                        builder: (_) => CSSBookContent()),
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
                          "CSS tutorial or CSS 3 tutorial provides basic and advanced concepts of CSS technology. Our CSS tutorial is developed for beginners and professionals.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "CSS stands for Cascading Style Sheets. It is a style sheet language which is used to describe the look and formatting of a document written in markup language. It provides an additional feature to HTML. It is generally used with HTML to change the style of web pages and user interfaces. It can also be used with any kind of XML documents including plain XML, SVG and XUL.\nCSS is used along with HTML and JavaScript in most websites to create user interfaces for web applications and user interfaces for many mobile applications.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
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
class CSSBookContent extends StatefulWidget {
  const CSSBookContent({super.key});

  @override
  State<CSSBookContent> createState() => _CSSBookContentState();
}

class _CSSBookContentState extends State<CSSBookContent> {
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
                      MaterialPageRoute(builder: (_) => CSSBookInfo()),
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
        body: Container(child: Center(child: Text("CSS Book Content"))),
      ),
    );
  }
}
