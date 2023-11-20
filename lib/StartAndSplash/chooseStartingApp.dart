import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:mylearning/Widgets/custombutton.dart';
import 'package:mylearning/AdminComonents/AdminRegisterPage/adminLoginForm.dart';
import 'package:mylearning/UserComponents/UserRegisterationPages/userLoginForm.dart';
import 'userWelcomePage.dart';

class MyChooseStartAppScreen extends StatefulWidget {
  const MyChooseStartAppScreen({super.key});

  @override
  State<MyChooseStartAppScreen> createState() => _MyChooseStartAppScreenState();
}

class _MyChooseStartAppScreenState extends State<MyChooseStartAppScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        
        title: Text(
          'BLearning System APP',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: Column(children: [
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/courselogo.png"),
                ),
              ),
            ),
            SizedBox(height: 50),
            //!ِAdmin Register
            Opacity(
              opacity: _animation.value,
              child: Transform.translate(
                offset: Offset(0, _animation2.value),
                child: InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminLoginForm(),
                        ));
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(_w / 20),
                    height: _w / 4.4,
                    width: _w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 92, 172, 238),
                      // color: Color(0xffEDECEA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/images/adminsettings-male.png")),
                        Text(
                          'Adminstrator',
                          textScaleFactor: 1.6,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminLoginForm(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 30,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            //!User Register
            Opacity(
              opacity: _animation.value,
              child: Transform.translate(
                offset: Offset(0, _animation2.value),
                child: InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ));
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(_w / 20),
                    height: _w / 4.4,
                    width: _w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 92, 172, 238),
                      // color: Color(0xffEDECEA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/images/iconsuser.png")),
                        Text(
                          'User',
                          textScaleFactor: 1.6,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //!هنا الشغل
        onPressed: () {},
        child: Icon(
          Icons.mic,
          color: Colors.blue,
          size: 40,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
