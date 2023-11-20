import 'package:flutter/material.dart';
import 'package:mylearning/Widgets/custombutton.dart';
import '../UserComponents/UserRegisterationPages/userSignupForm.dart';
import '../UserComponents/UserRegisterationPages/userLoginForm.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color:Colors.black,size:30),),
        
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'BLearning System App',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Column(children: [
            SizedBox(height: 15),
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
            //Sign up
            CustomizedButton(
              buttonText: "SIGN UP",
              textColor: Colors.white,
              buttonColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupForm()),
                );
              },
            ),
            //log in
            CustomizedButton(
              buttonText: "SIGN IN",
              textColor: Colors.black,
              buttonColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginForm()),
                );
              },
            ),
            Divider(
                indent: 50, endIndent: 50, color: Colors.black, thickness: 2),
            //google sign in
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      // const SizedBox(width: 10.0),
                      Container(
                        // padding: const EdgeInsets.only(left: 20.0),
                        width: 130,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/icons/google.png"),
                            fit: BoxFit.none,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10.0),
                      Text(
                        "SIGN IN With Google",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //facebook sign in
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      // const SizedBox(width: 10.0),
                      Container(
                        // padding: const EdgeInsets.only(left: 20.0),
                        width: 130,

                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/icons/facebook.png"),
                            fit: BoxFit.none,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10.0),
                      Text(
                        "SIGN IN With Facebook",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Apple sign in
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      // const SizedBox(width: 10.0),
                      Container(
                        // padding: const EdgeInsets.only(left: 20.0),
                        width: 130,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/icons/apple.png"),
                            fit: BoxFit.none,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      // const SizedBox(width: 10.0),
                      Text(
                        "SIGN IN With Apple",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height:20),
          ]),
        ),
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
    );
  }


}
