import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

///
import 'package:mylearning/UserComponents/UserSearchPage/userSearchPage.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';
import 'package:mylearning/UserComponents/UserCameraPage/userCameraPage.dart';
import '../UserBottomHomeTab/userTabBar.dart';

class UserMyBottomTabs extends StatefulWidget {
  const UserMyBottomTabs({super.key});

  @override
  State<UserMyBottomTabs> createState() => _UserMyBottomTabsState();
}

class _UserMyBottomTabsState extends State<UserMyBottomTabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MyHomeTabBarItems(),
    SearchPage(),
    MyCameraScreen(),
    MySettingsPage()
  ];
  Widget _currentScreen = MyHomeTabBarItems();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pages[_currentIndex],
        floatingActionButton: AvatarGlow(
          glowColor: Colors.blueAccent,
          endRadius: 30.0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.mic,
              size: 35, //هنا هغيرها لما اجي اهندل الاكشن بالكلام
              color: Color.fromARGB(255, 5, 58, 150),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: Color.fromARGB(255, 236, 235, 235),
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.home,size:35.0,color:Colors.blue),
                        onPressed: () {
                          setState(() {
                      _currentIndex = 0;
                      _currentScreen = MyHomeTabBarItems();
                    });
                        },
                      ),
                      Text("Home",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search,size:35.0,color:Colors.blue),
                        onPressed: () {
                          setState(() {
                      _currentIndex = 1;
                      _currentScreen = SearchPage();
                    });
                        },
                      ),
                      Text("Search",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.camera,size: 35.0,color:Colors.blue),
                        onPressed: () {
                          setState(() {
                      _currentIndex = 2;
                      _currentScreen = MyCameraScreen();
                    });
                        },
                      ),
                      Text("Camera",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.account_circle_rounded,size:35.0,color:Colors.blue),
                        onPressed: () {
                          setState(() {
                      _currentIndex = 3;
                      _currentScreen = MySettingsPage();
                    });
                        },
                      ),
                      Text("Settings",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
            ),
      ),
    );
  }
}


//دا شكل تاني من bottom nav bar
/*
  MaterialButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                      _currentScreen = MyHomeTap();
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      Text("Home"),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                      _currentScreen = SearchPage();
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      Text("Search"),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                      _currentScreen = MyCameraScreen();
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera),
                      Text("Camera"),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                      _currentScreen = MySettingsPage();
                    });
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings),
                      Text("Settings"),
                    ],
                  ),
                ),
 */