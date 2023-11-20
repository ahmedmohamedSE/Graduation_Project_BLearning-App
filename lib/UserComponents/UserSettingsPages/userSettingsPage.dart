import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/animation.dart';
import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';

import '../UserNotificationsPage/userNotificationsPage.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  bool _value = false;
  bool _valuePrivacy = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            'Settings',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        //!Home Taps
                        // MaterialPageRoute(builder: (_) => MyNotifications()),
                        MaterialPageRoute(builder: (_) => MyNotifications()),
                        (Route<dynamic> route) => false);
                  });
                },
                icon: Icon(Icons.notifications,color:Color.fromARGB(255, 11, 71, 121))),
          )
        ],
        ),
      body:ListView(
        physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
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
                    MaterialPageRoute(builder: (_) => UpdateAccount()),
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
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/iconsuser.png"),
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
                    MaterialPageRoute(builder: (_) => AccountOption()),
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
                    MaterialPageRoute(builder: (_) => PrivacyOption()),
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
                    MaterialPageRoute(builder: (_) => AppLanguageOption()),
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
          //help Option
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    //!Home Taps
                    MaterialPageRoute(builder: (_) => HelpOption()),
                    (Route<dynamic> route) => false);
              });
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.indigo,
                ),
                title: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Help",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "Help Center,contact us",
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
          //StorageAndData Option
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    //!Home Taps
                    MaterialPageRoute(builder: (_) => StorageAndDataOption()),
                    (Route<dynamic> route) => false);
              });
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                leading: Icon(
                  Icons.storage_rounded,
                  color: Colors.indigo,
                ),
                title: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Storage and data",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "Network usage , auto-download",
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
          //log out
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
            width: 200,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(24.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Color.fromARGB(255, 63, 157, 181),
                foregroundColor: Colors.white,
              ),
              child: const Text("LOGOUT"),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
              width: 200,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Text("Blearning System\n\t\t\t\tApp")),
        ],
      ),
        ],
      )
      ,
    );
  }


}

class StorageAndDataOption extends StatefulWidget {
  const StorageAndDataOption({super.key});

  @override
  State<StorageAndDataOption> createState() => _StorageAndDataOptionState();
}

class _StorageAndDataOptionState extends State<StorageAndDataOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Storage And DataOption"),
      ),
      body: Center(child: Text("Storage And DataOption")),
    );
  }
}

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({super.key});

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Settings"),
      ),
      body: Center(child: Text("Update Account")),
    );
  }
}

class AccountOption extends StatefulWidget {
  const AccountOption({super.key});

  @override
  State<AccountOption> createState() => _AccountOptionState();
}

class _AccountOptionState extends State<AccountOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Account Option"),
      ),
      body: Center(child: Text("Account option")),
    );
  }
}

class PrivacyOption extends StatefulWidget {
  const PrivacyOption({super.key});

  @override
  State<PrivacyOption> createState() => _PrivacyOptionState();
}

class _PrivacyOptionState extends State<PrivacyOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Privacy Option"),
      ),
      body: Center(child: Text("Privacy Option")),
    );
  }
}

class AppLanguageOption extends StatefulWidget {
  const AppLanguageOption({super.key});

  @override
  State<AppLanguageOption> createState() => _AppLanguageOptionState();
}

class _AppLanguageOptionState extends State<AppLanguageOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("App Language Option"),
      ),
      body: Center(child: Text("App Language Option")),
    );
  }
}

class HelpOption extends StatefulWidget {
  const HelpOption({super.key});

  @override
  State<HelpOption> createState() => _HelpOptionState();
}

class _HelpOptionState extends State<HelpOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        // elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Help Option"),
      ),
      body: Center(child: Text("Help Option")),
    );
  }
}
