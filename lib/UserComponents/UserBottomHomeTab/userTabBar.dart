import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:mylearning/UserComponents/UserLecturesPages/userC++Lecture.dart';
import 'package:mylearning/UserComponents/UserSearchPage/userSearchPage.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';
import 'package:mylearning/UserComponents/UserCameraPage/userCameraPage.dart';

//Screen Taps
import '../../Widgets/userForYouTab.dart';
import 'package:mylearning/UserComponents/UsreCoursesCategories/userCoursesViewTap.dart';
// import 'package:mylearning/UserComponents/UserBooksCategoriesPages/userbooksViewCardsTap.dart';
import 'package:mylearning/UserComponents/UserExamsPage/userExamsCardsTap.dart';
import 'package:mylearning/UserComponents/UserQuizCateogriesPages/userQuizzesCardsTap.dart';

import '../UserBooksCategoriesPages/userAlgoBookContent.dart';
import '../UserBooksCategoriesPages/userCBookContent.dart';
import '../UserBooksCategoriesPages/userCPlusBookContent.dart';
import '../UserBooksCategoriesPages/userCSSBookContent.dart';
import '../UserBooksCategoriesPages/userJavaBookContent.dart';
import '../UserBooksCategoriesPages/userPythonBookContent.dart';
import '../UserLecturesPages/userAndroidLecture.dart';
import '../UserLecturesPages/userDartLecture.dart';
import '../UserLecturesPages/userCSharpLecture.dart';
import '../UserLecturesPages/userHTMLLecture.dart';
import '../UserLecturesPages/userKotlinLectures.dart';
import '../UserLecturesPages/userSwiftlecture.dart';

class MyHomeTabBarItems extends StatefulWidget {
  const MyHomeTabBarItems({super.key});

  @override
  State<MyHomeTabBarItems> createState() => _MyHomeTapState();
}

class _MyHomeTapState extends State<MyHomeTabBarItems>
    with TickerProviderStateMixin {
  final Color primaryColor = Colors.greenAccent;
  final Color bgColor = const Color(0xffF9E0E3);
  final Color secondaryColor = const Color(0xff324558);

  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -50).animate(CurvedAnimation(
        parent: _controller2, curve: Curves.fastLinearToSlowEaseIn));

    _controller.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
            toolbarTextStyle: TextTheme(
              titleLarge: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ).bodyMedium,
            titleTextStyle: TextTheme(
              titleLarge: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ).titleLarge,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text('Home Page'),
            iconTheme: IconThemeData(color: Colors.black),
            //لازم تغير الايقونه
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          //!Home Taps
                          MaterialPageRoute(builder: (_) => MyNotifications()),
                          // (Route<dynamic> route) => false
                        );
                      });
                    },
                    child:
                        Icon(Icons.notifications_active, color: Colors.blue)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(builder: (_) => MySettingsPage()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Icon(Icons.account_circle, color: Colors.blue),
                ),
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              physics: AlwaysScrollableScrollPhysics(),
              labelColor: Color.fromARGB(255, 36, 156, 253),
              indicatorColor: Color.fromARGB(255, 243, 4, 4),
              unselectedLabelColor: Color.fromARGB(255, 48, 48, 48),
              tabs: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.blue),
                      Text("For You",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.blue),
                      Text("Courses",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.blue),
                      Text("Books",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.blue),
                      Text("Exams",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.blue),
                      Text("Quizzes",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              //!For top Tap
              ForyouTabBaritem(w: _w),
              //!Course Tap
              CoursesTabBarItem(),
              //!Books Tap
              BooksTabBarItem(),
              //!Exams Tap
              ExamsTabBarItem(),
              //!Quizze Tap
              QuizzesTabBarItem(),
            ],
          ),
        ),
      ),
    );
  }
}

//!Quizzes TabBar Class
class QuizzesTabBarItem extends StatefulWidget {
  const QuizzesTabBarItem({
    super.key,
  });

  @override
  State<QuizzesTabBarItem> createState() => _QuizzesTabBarItemState();
}

class _QuizzesTabBarItemState extends State<QuizzesTabBarItem>
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

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));

    _controller!.forward();
    _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              //!Search
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                // padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Wellcome Back\nQuiz Page",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            "Free Categories",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 238, 238),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          icon: Icon(Icons.search, color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //!first
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/C_programming.png"))),
                                Text(
                                  "C Language Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/C_sharp.png"))),
                                Text(
                                  "C# Language Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!second
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/flutter.png"))),
                                Text(
                                  "Flutter Free Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/dart.png"))),
                                Text(
                                  "Dart Language Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!third
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/c++.png"))),
                                Text(
                                  "C++ Language Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/html5.png"))),
                                Text(
                                  "HTML5 Language Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!fourth
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/css3.png"))),
                                Text(
                                  "CSS3 Language Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/icons8-angularjs.png"))),
                                Text(
                                  "AngularJS Development Free Quiz",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!result & rate
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/book.png"))),
                                Text(
                                  "Scour of My Answers",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/book.png"))),
                                Text(
                                  "Rate for Quiz Categories",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _w / 20),
            ],
          ),
          // Blur the Status bar
          // blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget quizPageCardsGroup(Image image1, String title1, BuildContext context,
      Widget route1, Image image2, String title2, Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          quizPageCard(image1, title1, context, route1),
          quizPageCard(image2, title2, context, route2),
        ],
      ),
    );
  }

  Widget quizPageCard(
      Image imagae, String title, BuildContext context, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation!.value,
      child: Transform.translate(
        offset: Offset(0, _animation2!.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  // child: Image(image:AssetImage(image))
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback? press;
  const QuizCard({
    super.key,
    required this.title,
    required this.img,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              color: Colors.white,
              spreadRadius: -23,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image(image: AssetImage(img)),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Text("Start"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//!Exams TabBar Class
class ExamsTabBarItem extends StatefulWidget {
  const ExamsTabBarItem({super.key});

  @override
  State<ExamsTabBarItem> createState() => _ExamsTabBarItemState();
}

class _ExamsTabBarItemState extends State<ExamsTabBarItem>
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

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));

    _controller!.forward();
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              //!Search
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                // padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Wellcome Back\nExam Page",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Free exams",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 238, 238),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          icon: Icon(Icons.search, color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //!first
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/C_programming.png"))),
                                Text(
                                  "C Programming Language",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/C_sharp.png"))),
                                Text(
                                  "C# Programming Language",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!second
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/flutter.png"))),
                                Text(
                                  "Flutter Development",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/dart.png"))),
                                Text(
                                  "Dart Programming Language",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!third
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/c++.png"))),
                                Text(
                                  "C++ Programming Language",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/html5.png"))),
                                Text(
                                  "HTML5 Programming Language",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!fourth
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/css3.png"))),
                                Text(
                                  "CSS# Language",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/courses_icons/icons8-angularjs.png"))),
                                Text(
                                  "Angular JS Framework Development",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //!result & rate
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/book.png"))),
                                Text(
                                  "Result of Exam",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation!.value,
                      child: Transform.translate(
                        offset: Offset(0, _animation2!.value),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RouteQuizTab();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: _w / 2,
                            width: _w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff040039).withOpacity(.15),
                                  blurRadius: 99,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(),
                                Container(
                                    height: _w / 8,
                                    width: _w / 8,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/book.png"))),
                                Text(
                                  "Rate for Exam Categories",
                                  maxLines: 4,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black.withOpacity(.5),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _w / 20),
            ],
          ),
          // Blur the Status bar
          // blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget quizPageCardsGroup(Image image1, String title1, BuildContext context,
      Widget route1, Image image2, String title2, Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          quizPageCard(image1, title1, context, route1),
          quizPageCard(image2, title2, context, route2),
        ],
      ),
    );
  }

  Widget quizPageCard(
      Image imagae, String title, BuildContext context, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation!.value,
      child: Transform.translate(
        offset: Offset(0, _animation2!.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  // child: Image(image:AssetImage(image))
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RouteQuizTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}

//!Books TabBar Class
class Books {
  String? image;
  String? title;
  String? description;
  double? rating;

  Books({this.description, this.image, this.rating, this.title});
}

final List<Books> book = [
  Books(
    image: 'assets/Books_images/Algorithms.jpg',
    title: 'Learning Algorithms',
    description: 'A Good Experience of Algorithms For Bigeners',
    rating: 4.8,
  ),
  Books(
    image: 'assets/Books_images/Java.jpg',
    title: 'Learning Java Language',
    description: 'A Good Experience of Biology',
    rating: 4.2,
  ),
  Books(
    image: 'assets/Books_images/CSS.jpg',
    title: 'Learning CSS Language',
    description: 'A Good Experience of CSS3 For Bigeners',
    rating: 4.5,
  ),
  Books(
    image: 'assets/Books_images/Git.jpg',
    title: 'Learning Git Technique',
    description: 'A Good Experience of Git ',
    rating: 4.7,
  ),
  Books(
    image: 'assets/Books_images/Python.jpg',
    title: 'Learning Python',
    description: 'A Good Experience of Python For Bigeners',
    rating: 4.5,
  ),
];

class BooksTabBarItem extends StatefulWidget {
  const BooksTabBarItem({super.key});

  @override
  State<BooksTabBarItem> createState() => _BooksTabBarItemState();
}

class _BooksTabBarItemState extends State<BooksTabBarItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
          const SizedBox(height: 10.0),
          //window for search
          Container(
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 238, 238),
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                icon: Icon(Icons.search, color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
          //popular hotel
          const SizedBox(height: 30.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Popular Books',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: book.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 200,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 140.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(book[index].image!),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          book[index].title!,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          book[index].description!,
                          style: const TextStyle(
                              fontSize: 13.0, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 10.0, top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  '${book[index].rating}',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 16.0,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Free Books',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  'view all',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              //!Algo Book
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AlgoBookInfo()),
                      );
                    });
                  },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/Books_images/Algorithms.jpg"),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Text(
                                "Learn Algorithms Book",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Text(
                              //   book[index].description!,
                              //   style: const TextStyle(
                              //     fontSize: 14.0,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: const <Widget>[
                                    Text("Click to start",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 300,
                          child: Center(
                            // child: Transform.rotate(
                            //  angle: pi / -1,
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    offset: Offset(2.0, 4.4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Read Now',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //!C Book
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CLanguageBookInfo()),
                      );
                    });
                  },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/Books_images/C.jpg"),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Text(
                                "Learn C Language Book",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Text(
                              //   book[index].description!,
                              //   style: const TextStyle(
                              //     fontSize: 14.0,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: const <Widget>[
                                    Text("Click to start",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 300,
                          child: Center(
                            // child: Transform.rotate(
                            //  angle: pi / -1,
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    offset: Offset(2.0, 4.4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Read Now',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //!C++ Book
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CPlusBookInfo()),
                      );
                    });
                  },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/Books_images/C++.jpg"),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Text(
                                "Learn C++ Language Book",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Text(
                              //   book[index].description!,
                              //   style: const TextStyle(
                              //     fontSize: 14.0,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: const <Widget>[
                                    Text("Click to start",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 300,
                          child: Center(
                            // child: Transform.rotate(
                            //  angle: pi / -1,
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    offset: Offset(2.0, 4.4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Read Now',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //!CSS Book
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CSSBookInfo()),
                      );
                    });
                  },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/Books_images/CSS.jpg"),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Text(
                                "Learn CSS Language Book",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Text(
                              //   book[index].description!,
                              //   style: const TextStyle(
                              //     fontSize: 14.0,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: const <Widget>[
                                    Text("Click to start",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 300,
                          child: Center(
                            // child: Transform.rotate(
                            //  angle: pi / -1,
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    offset: Offset(2.0, 4.4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Read Now',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //!Javascript Book
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => JavaBookInfo()),
                      );
                    });
                  },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 105,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/Books_images/Java.jpg"),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 95,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Text(
                                "Learn Java Language Book",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Text(
                              //   book[index].description!,
                              //   style: const TextStyle(
                              //     fontSize: 14.0,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: const <Widget>[
                                    Text("Click to start",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 300,
                          child: Center(
                            // child: Transform.rotate(
                            //  angle: pi / -1,
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    offset: Offset(2.0, 4.4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Read Now',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //!Python Book
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PythonBookInfo()),
                      );
                    });
                  },
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/Books_images/Python.jpg"),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Text(
                                "Learn Python Language Book",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 40),
                              // Text(
                              //   book[index].description!,
                              //   style: const TextStyle(
                              //     fontSize: 14.0,
                              //     color: Colors.grey,
                              //   ),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Row(
                                  children: const <Widget>[
                                    Text("Click to start",
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 40,
                          left: 300,
                          child: Center(
                            // child: Transform.rotate(
                            //  angle: pi / -1,
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 15.0,
                                    offset: Offset(2.0, 4.4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Read Now',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 20),
        ],
      ),
    );
  }
}



/*
class BooksTabBarItem extends StatefulWidget {
  const BooksTabBarItem({
    super.key,
  });

  @override
  State<BooksTabBarItem> createState() => _BooksTabBarItemState();
}

class _BooksTabBarItemState extends State<BooksTabBarItem> {
  
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(top: 15),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/html5.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "HTML",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/courses_icons/android-studio.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Android Studio",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/courses_icons/C_sharp.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "C#",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/figma.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Figma",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/swift.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Swift",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/courses_icons/graphql.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Graphic",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/css3.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "CSS 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 5.0),
        //!HTML5
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/html5.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "HTML5 Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 15),
                            Text("Rate")
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!kotlin
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/kotlin.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Kotlin Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!C++
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/c++.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "C++ Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 15),
                            Text("Rate")
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(top: 15),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Chip(
                    label: Text('Mobile Develpment'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Business'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('AI'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('IT & Software'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Mobile Develpment'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Mobile Develpment'),
                    onDeleted: () {},
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),

        SizedBox(height: 5),
        //!Java
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/java.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Java Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Auto Cad
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/courses_icons/autodesk-autocad.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Autodesk-Autocad Development",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Javascript
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/courses_icons/javascript.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "JavaScript Programming\nLanguage",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("Rate",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Swift
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/swift.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Swift Programming Language\nDevelopment For Bigeners",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Text("The Best Books",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
*/

//!Course TabBar Class
class CoursesTabBarItem extends StatefulWidget {
  const CoursesTabBarItem({
    super.key,
  });

  @override
  State<CoursesTabBarItem> createState() => _CoursesTabBarItemState();
}

class _CoursesTabBarItemState extends State<CoursesTabBarItem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(top: 15),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HTML5CourseALLLectures()),
                    );
                  });
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/html5.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "HTML",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AndroidCourseALLLectures()),
                    );
                  });
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/courses_icons/android-studio.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Android Studio",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CSharpCourseALLLectures()),
                    );
                  });
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/courses_icons/C_sharp.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "C#",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/figma.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Figma",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/swift.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Swift",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image:
                                AssetImage("assets/courses_icons/graphql.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "Graphic",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/courses_icons/css3.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        color: Color.fromARGB(221, 48, 48, 48),
                        child: const Text(
                          "CSS 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 5.0),
        //!HTML5
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HTML5CourseALLLectures()),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/html5.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "HTML5 Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 15),
                            Text("Rate")
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!kotlin
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => KotlinCourseALLLectures()),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/kotlin.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Kotlin Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!C++
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CplusCourseALLLectures()),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/c++.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "C++ Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 15),
                            Text("Rate")
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(top: 15),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Wrap(
                direction: Axis.vertical,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Chip(
                    label: Text('Mobile Develpment'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Business'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('AI'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('IT & Software'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Economic Courses'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Web Develpment'),
                    onDeleted: () {},
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),

        SizedBox(height: 5),
        //!Java
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/java.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Java Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Auto Cad
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/courses_icons/autodesk-autocad.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Autodesk-Autocad Development",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Javascript
        GestureDetector(
          onTap: () {
            print("Card 1");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/courses_icons/javascript.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "JavaScript Programming\nLanguage",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("Rate",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Swift
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SwiftCourseALLLectures()),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/swift.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Swift Programming Language\nDevelopment For Bigeners",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Text("The Best Books",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

//!For you TabBar Class
class ForyouTabBaritem extends StatefulWidget {
  const ForyouTabBaritem({
    super.key,
    required double w,
  }) : _w = w;

  final double _w;

  @override
  State<ForyouTabBaritem> createState() => _ForyouTabBaritemState();
}

class _ForyouTabBaritemState extends State<ForyouTabBaritem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Text(
            "The Most Courses",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        //!C++
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CplusCourseALLLectures()),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/c++.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "C++ Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 15),
                            Text("Rate")
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!HTML5
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HTML5CourseALLLectures()),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/html5.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "HTML5 Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 15),
                            Text("Rate")
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Flutter
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                //!Home Taps
                MaterialPageRoute(builder: (_) => CSharpCourseALLLectures()),
                // (Route<dynamic> route) => false
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/flutter.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Flutter Development\nFramework",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            SizedBox(width: 10),
                            Text("(The Best Choice)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 82, 146)))
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //!Dart
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,

                MaterialPageRoute(builder: (_) => DartCourseALLLectures()),
                // (Route<dynamic> route) => false
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("assets/courses_icons/dart.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Dart Programming Language",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                        const Text("Free Turorials",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                            Icon(Icons.star, color: Colors.pink, size: 22),
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Text(
                              "Continue Learning Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        //!Books
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text("The Best Books",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        //Python Book
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PythonBookInfo()),
              );
            });
          },
          child: Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/Books_images/pythonbook2.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Expanded(
                              child: Text(
                                "Python Roadmap for Bigeners",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                    fontSize: 18),
                                softWrap: true,
                              ),
                            ),
                            // _buildTag(conte
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(
                                text: "Year 2022",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          // style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: <Widget>[
                            Text("Condition"),
                            SizedBox(width: 10.0),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //c programming
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CLanguageBookInfo()),
              );
            });
          },
          child: Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/Books_images/c language.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Expanded(
                              child: Text(
                                "C Programming Language\nRoadmap for Bigeners",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                    fontSize: 18),
                                softWrap: true,
                              ),
                            ),
                            // _buildTag(conte
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(
                                text: "Year 2019",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          // style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: <Widget>[
                            Text("Condition"),
                            SizedBox(width: 10.0),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //Java
        GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JavaBookInfo()),
              );
            });
          },
          child: Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/courses_icons/java.png"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Expanded(
                              child: Text(
                                "Java Roadmap for Bigeners",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                    fontSize: 18),
                                softWrap: true,
                              ),
                            ),
                            // _buildTag(conte
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(
                                text: "Year 2022",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          // style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: <Widget>[
                            Text("Condition"),
                            SizedBox(width: 10.0),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

class Book {
  final String bookimage;
  final String? booktitle;
  final String? booksubtitle;
  final String? bookrate;
  final String? bookprice;
  final String? bookdescription;

  Book({
    required this.bookimage,
    this.booktitle,
    this.booksubtitle,
    this.bookrate,
    this.bookprice,
    this.bookdescription,
  });
}

class Course {
  final String image;
  final String? title;
  final String? subtitle;
  final double? rate;
  final double? price;
  final List<Lecture> lectures;

  Course(
      {required this.image,
      this.title,
      this.subtitle,
      this.rate,
      this.price,
      required this.lectures});
}

class Lecture {
  final String image;
  final String? title;
  final String? description;
  final int duration;

  Lecture(
      {required this.image,
      this.title,
      this.description,
      required this.duration});
}

List<Course> courses = [
  Course(
    image: 'assets/images/book.png',
    title: 'Introduction to Flutter Development',
    subtitle: 'Learn Flutter development from scratch',
    rate: 4.5,
    price: 99.99,
    lectures: [
      Lecture(
        image: 'assets/images/book.png',
        title: 'Introduction to Flutter',
        description: 'Learn about the basics of Flutter and its advantages',
        duration: 30,
      ),
      Lecture(
        image: 'assets/images/book.png',
        title: 'Building Layouts in Flutter',
        description: 'Learn how to build layouts in Flutter using widgets',
        duration: 45,
      ),
      // Add more lectures here
    ],
  ),
  Course(
    image: 'assets/course2.jpg',
    title: 'Advanced Flutter Development',
    subtitle: 'Take your Flutter skills to the next level',
    rate: 4.8,
    price: 149.99,
    lectures: [
      Lecture(
        image: 'assets/images/book.png',
        title: 'State Management in Flutter',
        description:
            'Learn about different state management techniques in Flutter',
        duration: 60,
      ),
      Lecture(
        image: 'assets/images/book.png',
        title: 'Flutter Animations',
        description: 'Learn how to add animations to your Flutter app',
        duration: 45,
      ),
      // Add more lectures here
    ],
  ),
  // Add more courses here
];
