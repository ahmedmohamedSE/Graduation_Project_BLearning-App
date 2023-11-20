import 'package:flutter/material.dart';

class SecondTestPage extends StatefulWidget {
  const SecondTestPage({super.key});

  @override
  State<SecondTestPage> createState() => _SecondTestPageState();
}

class _SecondTestPageState extends State<SecondTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios,size: 30,color:Colors.black),
        ),
        title: Text("second Test Page",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
        
      ),
      body: Center(child:Text("second Test Page"),),
    );
  }
}
