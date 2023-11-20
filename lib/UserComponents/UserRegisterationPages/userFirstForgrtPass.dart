import 'package:flutter/material.dart';
import './userSecondForgetPass.dart';

class FirstForgetPage extends StatefulWidget {
  const FirstForgetPage({super.key});

  @override
  State<FirstForgetPage> createState() => _FirstForgetPageState();
}

class _FirstForgetPageState extends State<FirstForgetPage> {
  String? _email;

  final _formKey = GlobalKey<FormState>();
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
            Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                Text(
                  'Forget Password?',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200,
                  width: 350,
                  child: Image(
                    image: AssetImage("assets/images/forgetpasspage.png"),
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enter the email address associated with your account To Recieve a Verification Code',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "entir your valid email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 100,
                  width: 300,
                  child: Center(
                    child: ElevatedButton(
                      //!في شغل هنا
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SecondForgetPage()));
                        });
                      },
                      child: Text(
                        'Send email',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
          ],
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
      ),
    );
  }


}
