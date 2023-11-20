// import 'package:flutter/material.dart';
// import 'package:mylearning/UserComponents/UserHomeBottomTaps/userMainBottomTaps.dart';
// import 'dart:async';
// import 'package:mylearning/UserComponents/UserNotificationsPage/userNotificationsPage.dart';

// class ResultScann extends StatefulWidget {
//   const ResultScann({super.key, required this.text});
//    String text;

//   @override
//   State<ResultScann> createState() => _ResultScannState();
// }

// class _ResultScannState extends State<ResultScann> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             setState(() {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   //!Home Taps
//                   MaterialPageRoute(builder: (_) => UserMyBottomTabs()),
//                   (Route<dynamic> route) => false);
//             });
//           },
//           icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           'Camera Page',
//           style: TextStyle(
//               color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.black, size: 30),
//             onPressed: () {
//               setState(() {
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     //!Home Taps
//                     MaterialPageRoute(builder: (_) => MyNotifications()),
//                     (Route<dynamic> route) => false);
//               });
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(30.0),
//         child: Text(text),
//       ),
//     );
//   }
// }
