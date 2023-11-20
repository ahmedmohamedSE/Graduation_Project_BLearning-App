import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';
import 'package:mylearning/UserComponents/UserSearchPage/userSearchPage.dart';
import 'package:mylearning/UserComponents/UserCameraPage/userCameraPage.dart';

/*
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedPage = 0;
  List<Widget> _pages=[
    HomePage(),
    FavScreen(),
    CameraScreen(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: _pages[_selectedPage],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white.withOpacity(0.2),
          foregroundColor: Colors.white,
          child: Icon(
            Icons.mic,
            size: 55,
            color: Colors.blue,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          backgroundColor: Colors.lightBlue,
          currentIndex: _selectedPage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),),
            BottomNavigationBarItem(
                icon: Icon(Icons.star, size: 30),),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_enhance, size: 30),),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2, size: 30),),
          ],
        ),
      ),
    );
  }
}
*/
/*
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  int currentIndex = 0;
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
      },
      {
        'page': FavScreen(),
      },
      {
        'page': CameraScreen(),
      },
      {
        'page': AccountPage(),
      },
    ];
    super.initState();
  }

  void _SelectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: _pages.length'page'[_selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
              // elevation: 5.0,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 20.0,
          color: Colors.blue,
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.home),
                  onPressed: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      currentIndex = 1;
                      print("${currentIndex}");
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    setState(() {
                      currentIndex = 2;
                      print("${currentIndex}");
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.list),
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                      print("${currentIndex}");
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
// Stateful widget created
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
// index given for tabs
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  // Number of tabs
  final tabs = [
    UserMyBottomTabs(),
    SearchPage(),
    MyCameraScreen(),
    MySettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar given
      backgroundColor: Colors.transparent,
      body: tabs[currentIndex],

      // floating action button in center
      floatingActionButton: AvatarGlow(
        endRadius: 40.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.mic,
            size: 35, //هنا هغيرها لما اجي اهندل الاكشن بالكلام
            color: Colors.blueAccent,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent.withOpacity(.15),
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // button 1
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: currentIndex == 0 ? 45 : 35,
                  color: currentIndex == 0 ? Colors.blueAccent : Colors.grey,
                ),
                onPressed: () {
                  setBottomBarIndex(0);
                },
                splashColor: Colors.white,
              ),

              // button 2
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: currentIndex == 1 ? 45 : 35,
                    color: currentIndex == 1 ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setBottomBarIndex(1);
                  }),
              SizedBox.shrink(),

              // button 3
              IconButton(
                  icon: Icon(
                    Icons.camera_enhance,
                    size: currentIndex == 2 ? 45 : 35,
                    color: currentIndex == 2 ? Colors.blueAccent : Colors.grey,
                  ),
                  onPressed: () {
                    setBottomBarIndex(2);
                  }),

              // button 4
              IconButton(
                  icon: Icon(
                    Icons.person,
                    size: currentIndex == 3 ? 45 : 35,
                    color: currentIndex == 3 ? Colors.blueAccent : Colors.grey,
                  ),
                  onPressed: () {
                    setBottomBarIndex(3);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
