import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ForyouTabBatItem extends StatefulWidget {
  const ForyouTabBatItem({super.key});

  @override
  State<ForyouTabBatItem> createState() => _ForyouTabBatItemState();
}

class _ForyouTabBatItemState extends State<ForyouTabBatItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text("For you Tab Bar Item"),)
    );
  }
}







class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI> with TickerProviderStateMixin {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   color: Colors.white,
          // ),
          // background color
          backgroundColor(),

          /// ListView
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: _w / 5.5),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
              card('Example example example', 'Example', Icons.favorite,
                  RouteWhereYouGo()),
            ],
          ),
        ],
      ),
    );
  }

  Widget card(String title, String subtitle, IconData icon, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: Container(
          height: _w / 2.3,
          width: _w,
          padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => route));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
              child: Padding(
                padding: EdgeInsets.all(_w / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: _w / 3,
                      width: _w / 3,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: _w / 10,
                      ),
                    ),
                    SizedBox(width: _w / 40),
                    SizedBox(
                      width: _w / 2.05,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _w / 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            subtitle,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(1),
                              fontSize: _w / 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Tap to know more',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _w / 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class backgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xff7DDFFF),
          //     Color(0xffB09EFF),
          //     Color(0xffED92EF),
          //     Color(0xffF9B1D0),
          //     Color(0xffE8B8E0),
          //   ],
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          // ),
          ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Container(
            height: _w / 3,
            width: double.infinity,
            // padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                // HapticFeedback.lightImpact();
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => route));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 75, 73, 73).withOpacity(.2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border:
                        Border.all(color: Colors.white.withOpacity(.1), width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(_w / 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: _w / 3,
                        width: _w / 3,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: _w / 10,
                        ),
                      ),
                      SizedBox(width: _w / 40),
                      SizedBox(
                        width: _w / 2.05,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Title",
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _w / 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 1,
                              ),
                            ),
                            Text(
                              "Sub Title",
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white.withOpacity(1),
                                fontSize: _w / 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Tap to know more',
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: _w / 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}







/*
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'dart:ui';
import 'dart:async';

class ForYouCategory extends StatefulWidget {
  const ForYouCategory({super.key});

  @override
  State<ForYouCategory> createState() => _ForYouCategoryState();
}

class _ForYouCategoryState extends State<ForYouCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("For You Categories")),
      ),
    );
  }
}

*/
