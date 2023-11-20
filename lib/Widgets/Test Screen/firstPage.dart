import 'package:flutter/material.dart';

class FirstTestPage extends StatefulWidget {
  const FirstTestPage({super.key});

  @override
  State<FirstTestPage> createState() => _FirstTestPageState();
}

class _FirstTestPageState extends State<FirstTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios,size: 30,color:Colors.black),
        ),
        title: Text("First Test Page",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
        
      ),
      body: Center(child:Text("First Test Page"),),
    );
  }
}
