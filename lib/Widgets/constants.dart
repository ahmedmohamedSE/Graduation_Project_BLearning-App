import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

//Normal Colors
const Color black = CupertinoColors.black;
const Color white = CupertinoColors.white;
const Color grey = CupertinoColors.systemGrey;
const Color red = CupertinoColors.systemRed;

//RGBO Colors
const Color blue = Color.fromRGBO(53, 139, 191, 1);
const Color yellow = Color.fromRGBO(229, 190, 46, 1);
const Color scaffoldbg = Color.fromRGBO(15, 75, 137, 1);
const Color containercolor = Color.fromRGBO(237, 238, 241, 1);
// const Color textfieldbg = Color.fromRGBO(8, 54, 100, 1);

//Font
final deftext = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
var font = GoogleFonts.montserrat(
  fontSize: 20,
  color: black,
  letterSpacing: 1,
  fontWeight: FontWeight.bold,
);

class GlobalColors {
  static HexColor maincolor = HexColor('#1E3190');
  static HexColor txtcolor = HexColor('#4F4F4F');
}

const KBGColor = Color(0xFFF8F8F8F);
const KActiveIconColor = Color(0xFFE68342);
const KTextColor = Color(0xFF222B45);
const KBluelightColor = Color(0xFFC7B8F5);
const KBlueColor = Color(0xFF817DC0);
const KShadowColor = Color(0xFFE6E6E6);

const kDefaultPadding = 20.0;
const KdefaultShadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Colors.black12 //black with 12% opacity
    );

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.color,
      required this.onPressed,
      required this.text})
      : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
/*
CircleAvatar(
                           backgroundColor: Colors.blue.withOpacity(.1),
                          radius: _w / 15,
                         child: Image(
                              image: AssetImage("assets/images/admin.png")),
                         ),


 */