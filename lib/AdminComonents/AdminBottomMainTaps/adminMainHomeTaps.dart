import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidable/hidable.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';

//!
import 'package:mylearning/UserComponents/UserSearchPage/userSearchPage.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';
import 'package:mylearning/UserComponents/UserCameraPage/userCameraPage.dart';

import 'package:flutter/services.dart';

//!Bottom main Tabs
class AdminBottomHomePage extends StatefulWidget {
  @override
  AdminBottomHomePageState createState() => AdminBottomHomePageState();
}

class AdminBottomHomePageState extends State<AdminBottomHomePage> {
  int _currentIndex = 0;
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.search,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Home',
    'Favorite',
    'Search',
    'Account',
  ];
  final List<Widget> _pages = [
    AdminBottomHomeTab(),
    AdminBottomFavTab(),
    AdminBottomSearvhTab(),
    AdminBottomSettingTab(),
  ];
  Widget _currentScreen = Center(child: Text("Home"));
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: Hidable(
        controller: _scrollController,
        child: Container(
          // color: Colors.deepPurpleAccent,
          height: size.width * .155,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = index;
                  // print(index);
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: size.width * .014),
                  Icon(listOfIcons[index],
                      size: index == _currentIndex ? size.width * .088 : 25,
                      color: index == _currentIndex
                          ? Color.fromARGB(255, 3, 87, 156)
                          : Color.fromARGB(255, 71, 71, 71)),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      top: index == _currentIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .153,
                    height: index == _currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 92, 161),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//!Settings Bottom Nav Bar Item
class AdminBottomSettingTab extends StatefulWidget {
  const AdminBottomSettingTab({
    super.key,
  });

  @override
  State<AdminBottomSettingTab> createState() => _AdminBottomSettingTabState();
}

class _AdminBottomSettingTabState extends State<AdminBottomSettingTab>
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

  bool _value = false;
  bool _valuePrivacy = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              title: const Text('Settings Page'),
              iconTheme: IconThemeData(color: Colors.black),
              //لازم تغير الايقونه
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            //!Home Taps
                            MaterialPageRoute(
                                builder: (_) => AdminNotifications()),
                            (Route<dynamic> route) => false);
                      });
                    },
                    child: Icon(Icons.notifications_active,
                        color: Colors.blue, size: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            //!Home Taps
                            MaterialPageRoute(
                                builder: (_) => AdminBottomSettingTab()),
                            (Route<dynamic> route) => false);
                      });
                    },
                    child:
                        Icon(Icons.menu_rounded, color: Colors.blue, size: 35),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              //!Home Taps
                              MaterialPageRoute(
                                  builder: (_) => UpdateAccount()),
                              (Route<dynamic> route) => false);
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/admin.png"),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Ahmed Mohamed Mohamed",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "Mobile App Developer",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 151, 150, 150),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.widgets_outlined,
                                color: Colors.blue,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    //Account Option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              //!Home Taps
                              MaterialPageRoute(
                                  builder: (_) => AccountOption()),
                              (Route<dynamic> route) => false);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.key,
                            color: Colors.indigo,
                          ),
                          title: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Account",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "Security notifications,change number",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 151, 150, 150),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    //Privacy Option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              //!Home Taps
                              MaterialPageRoute(
                                  builder: (_) => PrivacyOption()),
                              (Route<dynamic> route) => false);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.admin_panel_settings_outlined,
                            color: Colors.indigo,
                          ),
                          title: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Privacy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "Block Content,disappearing messages",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 151, 150, 150),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    //AppLanguage Option
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              //!Home Taps
                              MaterialPageRoute(
                                  builder: (_) => AppLanguageOption()),
                              (Route<dynamic> route) => false);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.language,
                            color: Colors.indigo,
                          ),
                          title: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "App Language",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "English",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 151, 150, 150),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),

                    Divider(thickness: 2.0),
                    //Notification Switch
                    SwitchListTile(
                        title: const Text(
                          "Notification",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: const Text("Turn On / Turn Off",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                            )),
                        value: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val;
                          });
                        }),

                    //Privacy Switch
                    SwitchListTile(
                        title: const Text(
                          "Privacy",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: const Text("Turn On / Turn Off",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                            )),
                        value: _value,
                        onChanged: (val) {
                          setState(() {
                            _valuePrivacy = val;
                          });
                        }),
                    //log out
                    const SizedBox(height: 10.0),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(24.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0)),
                          backgroundColor: Color.fromARGB(255, 63, 157, 181),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("LOGOUT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            )),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      width: 250,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                      child: Text("Blearning System\nApp",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

//!Search Bottom Nav Bar Item
class AdminBottomSearvhTab extends StatefulWidget {
  const AdminBottomSearvhTab({
    super.key,
  });

  @override
  State<AdminBottomSearvhTab> createState() => _AdminBottomSearvhTabState();
}

class _AdminBottomSearvhTabState extends State<AdminBottomSearvhTab>
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
    return SafeArea(
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
            title: const Text('Search Page'),
            iconTheme: IconThemeData(color: Colors.black),
            //لازم تغير الايقونه
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(
                              builder: (_) => AdminNotifications()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Icon(Icons.notifications_active,
                      color: Colors.blue, size: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(
                              builder: (_) => AdminBottomSettingTab()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Icon(Icons.menu_rounded, color: Colors.blue, size: 35),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Container(
                    // padding: const EdgeInsets.only(left: 20.0),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/admin.png"),
                        // fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Welcome Ahmed..",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "administrator of App",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  "Search For any Component...",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 218, 218),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none),
                    hintText: "eg:  user, course, book, ...etc",
                    hintStyle: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                    suffixIcon: Icon(Icons.mic),
                    suffixIconColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    children: [
                      //!user
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            // padding: const EdgeInsets.only(left: 20.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/icons/user.png"),
                                // fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Ali Mohamed",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //!user
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            // padding: const EdgeInsets.only(left: 20.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/icons/user.png"),
                                // fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Ali Ahmed",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //!Book
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            // padding: const EdgeInsets.only(left: 20.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/Books_images/Algorithms.jpg"),
                                // fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Learning Algorithms Book ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //!Course
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            // padding: const EdgeInsets.only(left: 20.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/courses_icons/flutter.png"),
                                // fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Flutter Development Course For Bigeners",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //!user
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          leading: Container(
                            // padding: const EdgeInsets.only(left: 20.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/icons/user.png"),
                                // fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Mohamed Ahmed",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
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
    );
  }
}

//!Favoriate Bottom Nav Bar Item
class AdminBottomFavTab extends StatefulWidget {
  const AdminBottomFavTab({
    super.key,
  });

  @override
  State<AdminBottomFavTab> createState() => _AdminBottomFavTabState();
}

class _AdminBottomFavTabState extends State<AdminBottomFavTab>
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
    return SafeArea(
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
            title: const Text('Favorite Page'),
            iconTheme: IconThemeData(color: Colors.black),
            //لازم تغير الايقونه
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(
                              builder: (_) => AdminNotifications()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Icon(Icons.notifications_active,
                      color: Colors.blue, size: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(
                              builder: (_) => AdminBottomSettingTab()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Icon(Icons.menu_rounded, color: Colors.blue, size: 35),
                ),
              ),
            ],
          ),
          // body:,
        ),
      ),
    );
  }
}

//!Home Bottom Nav Bar Item
class AdminBottomHomeTab extends StatefulWidget {
  const AdminBottomHomeTab({
    super.key,
  });

  @override
  State<AdminBottomHomeTab> createState() => _AdminBottomHomeTabState();
}

class _AdminBottomHomeTabState extends State<AdminBottomHomeTab>
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
    _dark = false;

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

  bool _dark = false;
  Brightness _darkBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Theme(
        data: ThemeData(
          // brightness: _darkBrightness(),
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
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          //!Home Taps
                          MaterialPageRoute(
                              builder: (_) => AdminNotifications()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Icon(Icons.notifications_active,
                      color: Colors.blue, size: 30),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _dark = !_dark;
                        });
                      },
                      icon: Icon(FontAwesomeIcons.moon, size: 25))),
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
                      Icon(Icons.settings_applications, color: Colors.blue),
                      Text("All",
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
                      Icon(Icons.settings_applications, color: Colors.blue),
                      Text("Users",
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
                      Icon(Icons.settings_applications, color: Colors.blue),
                      Text(
                        "Courses",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.settings_applications, color: Colors.blue),
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
                      Icon(Icons.settings_applications, color: Colors.blue),
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
                      Icon(Icons.settings_applications, color: Colors.blue),
                      Text("Quizzes",
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
                      Icon(Icons.settings_applications, color: Colors.blue),
                      Text("Feedbacks",
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
              //!All Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),

                        //!Users
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 250,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/iconsuser.png"),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                                Text(
                                  "Users",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue, size: 35),
                                )
                              ],
                            ),
                          ),
                        ),

                        //!Categories
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 250,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue, size: 35),
                                )
                              ],
                            ),
                          ),
                        ),

                        //!updates
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 250,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/adminsettings-male.png"),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                                Text(
                                  "New Updates",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue, size: 35),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //!Users Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        //!Show Users
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/iconsuser.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show existing Users",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!Avtive Users
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/iconsuser.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Activity of Users",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!Add Users
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/iconsuser.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Add New Users",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!Update Users
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/iconsuser.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Updates User's Data",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!Delete Users
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/iconsuser.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Delete User's Data",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //!Course Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        //!Show Existing Courses
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Existing Courses",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Show Most Access Courses
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Most Access\nCourses",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!Add New Courses
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Add New Courses",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Update Course Content
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Update Course Content",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!delete Courses
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Delete Course Content",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //!Books Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        //!Show Existing Books
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo2.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Existing Books",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Show Most Access Books
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo2.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Most Access\nBooks",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Add New Books
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo2.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Add New Books",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Updates Existing Books
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo2.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Updates Existing Books",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Delete Existing Books
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo2.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Delete Existing Books",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //!Exams Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        //!Show Existing Exams
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Existing Exams",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Show Most Access Exams
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Most Access\nExams",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //!Add New Exams
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Add New Exams",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Update Exams Content
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Update Exams Content",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!delete Exams
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bookLogo1.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Delete Exams Content",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //!Quizze Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        //!Show Existing Quizzes
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/quizlogo.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Existing Quizzes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Show Most Access Quizzes
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/quizlogo.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Show Most Access\nQuizzes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Add New Quizzes
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/quizlogo.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Add New Quizzes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!Update Exams Quizzes
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/quizlogo.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Update Exams Quizzes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //!delete Quizzes
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 5, bottom: 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 130,
                                  height: 140,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/quizlogo.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Delete Quiz Content",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blue, size: 35),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              //!Feedbak Tap
              Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        //!Show All Feedbacks
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 250,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/feedback2.jpg"),
                                        fit: BoxFit.fitWidth,
                                        ),
                                  ),
                                ),
                                Text(
                                  "Show All Feedbacks",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue, size: 35),
                                )
                              ],
                            ),
                          ),
                        ),
                        //!Sending Feedbacks
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 250,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/feedback2.jpg"),
                                        fit: BoxFit.fitWidth,
                                        ),
                                  ),
                                ),
                                Text(
                                  "Sending Feedbacks",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue, size: 35),
                                )
                              ],
                            ),
                          ),
                        ),
                        //!Write a Reports
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 108, 184, 247),
                            ),
                            width: double.infinity,
                            height: 250,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(30.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/feedback2.jpg"),
                                        fit: BoxFit.fitWidth,
                                        ),
                                  ),
                                ),
                                Text(
                                  "Write a Reports",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.blue, size: 35),
                                )
                              ],
                            ),
                          ),
                        ),

                       
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//! Admin Notifications
class AdminNotifications extends StatefulWidget {
  const AdminNotifications({super.key});

  @override
  State<AdminNotifications> createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications>
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
    _dark = false;

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

  bool _dark = false;
  Brightness _darkBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  final TextStyle dropdownMenuItem =
      const TextStyle(color: Colors.black, fontSize: 18);

  final primary = const Color(0xff696b9e);
  final secondary = const Color(0xfff29a94);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Theme(
        data: ThemeData(
          // brightness: _darkBrightness(),
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text('Notifications Page'),
              iconTheme: IconThemeData(color: Colors.black),
              //لازم تغير الايقونه
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            //!Home Taps
                            MaterialPageRoute(
                                builder: (_) => AdminNotifications()),
                            (Route<dynamic> route) => false);
                      });
                    },
                    child: Icon(Icons.notifications_active,
                        color: Colors.blue, size: 30),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _dark = !_dark;
                          });
                        },
                        icon: Icon(Icons.account_circle,
                            color: Colors.blue, size: 25))),
              ],
            ),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Search for a Notification..",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 22),
                      ),
                    ),
                    //!Search
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search....",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.mic, size: 35)),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    //!
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/courses_icons/C_sharp.png"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "C# Course new updates",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Text("at one day ago",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue, size: 35),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/courses_icons/c++.png"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "C++ Course new updates",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Text("at one day ago",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue, size: 35),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/Books_images/Git.jpg"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Git notification",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Text("at one day ago",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue, size: 35),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        width: double.infinity,
                        height: 85,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/Books_images/OracalDB.jpg"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Oracle Database book new updates",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Text("at one day ago",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue, size: 35),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/admin.png"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "notifications for you",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Text("at one day ago",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue, size: 35),
                            )
                          ],
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 233, 233, 233),
                        ),
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/admin.png"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "notifications For you",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Text("at one day ago",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                              letterSpacing: .3)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios,
                                  color: Colors.blue, size: 35),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
