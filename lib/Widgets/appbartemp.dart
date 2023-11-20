import 'package:flutter/material.dart';

import 'package:mylearning/UserComponents/UserSearchPage/userSearchPage.dart';
import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';
import 'package:mylearning/UserComponents/UserSettingsPages/userSettingsPage.dart';
import 'package:mylearning/UserComponents/UserCameraPage/userCameraPage.dart';


class AppBarTemplate extends StatefulWidget {
  const AppBarTemplate({super.key});

  @override
  State<AppBarTemplate> createState() => _AppBarTemplateState();
}

class _AppBarTemplateState extends State<AppBarTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'BLearning System',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.category)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        //!Home Taps
                        MaterialPageRoute(builder: (_) => MyNotifications()),
                        (Route<dynamic> route) => false);
                  });
                },
                child: Icon(Icons.notifications_active),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        //!Home Taps
                        MaterialPageRoute(builder: (_) => MySettingsPage()),
                        (Route<dynamic> route) => false);
                  });
                },
                child: Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
    );
  }
}