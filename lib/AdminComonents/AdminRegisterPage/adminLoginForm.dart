import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylearning/AdminComonents/AdminBottomMainTaps/adminMainHomeTaps.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
import 'CommonWidgets/comHelper.dart';
import 'CommonWidgets/genTextFormField.dart';
import 'package:mylearning/Models/UserDB/DBHelper.dart';
import 'package:mylearning/Models/UserDB/UserModel.dart';
// import 'SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './adminForgrtPassFirstly.dart';

class AdminLoginForm extends StatefulWidget {
  @override
  _AdminLoginFormState createState() => _AdminLoginFormState();
}

class _AdminLoginFormState extends State<AdminLoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;
  String? _NamehintText = 'Enter Username';
  String? _EmailhintText = 'Enter email';
  String? _PasswordhintText = 'Enter password';
  String? _ConfirmPasswordhintText = 'Confirm your password';

  bool? _checkbox = false;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          'BLearning System App',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
     physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
        children: [
          Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/admin.png"),fit: BoxFit.contain
                  ),
                ),
              ),
              Text(
                "Administrator SIGN IN",
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // getTextFormField(
              //     controller: _conUserId,
              //     icon: Icons.person,
              //     hintName: 'Username'),
              // SizedBox(height: 10.0),
              // getTextFormField(
              //   controller: _conPassword,
              //   icon: Icons.lock,
              //   hintName: 'Password',
              //   isObscureText: true,
              // ),
              //!Admin Name
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  // controller: ,

                  enabled: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter $_NamehintText';
                    }
                    if (_NamehintText == "Email" && !validateEmail(value)) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                    hintText: _NamehintText,
                    labelText: "Admin Name",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              //!email
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  // controller: ,

                  enabled: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter $_EmailhintText';
                    }
                    if (_EmailhintText == "Email" && !validateEmail(value)) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon:
                        Icon(Icons.email_outlined, color: Colors.blue),
                    hintText: _EmailhintText,
                    labelText: "Enter vaild email",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              //!password
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  // controller: ,

                  enabled: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter $_PasswordhintText';
                    }
                    if (_PasswordhintText == "Email" &&
                        !validateEmail(value)) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    prefixIcon: Icon(Icons.password, color: Colors.blue),
                    hintText: _PasswordhintText,
                    labelText: "Enter password",
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              // SizedBox(height: 5.0),
              //!Forget Password
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Checkbox(
                      value: this._checkbox,
                      onChanged: (bool? val) {
                        if (val != null) {
                          setState(() {
                            this._checkbox = val;
                          });
                        }
                      },
                    ),
                    Text(
                      "Remmeber Me",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 60),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text('Does not have account? '),
                            TextButton(
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FirstForgetPage()));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                // width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    'Admin SIGN IN',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminBottomHomePage(),
                          ));
                    });
                  },
                ),
              ),
              SizedBox(height:20),
            ],
          ),
        ),
      ),
    
        ],
      ),
    
    );
  }
}
