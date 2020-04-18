import 'package:flutter/material.dart';

var themeData = ThemeData(
  primaryColor: Color(0xff265699),
  accentColor: Color(0xff1BA0F2),
  errorColor: Color(0xffde483e),
  cursorColor: Color(0xff85C8F2),
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  fontFamily: 'Questrial',
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.white,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    contentTextStyle: TextStyle(
      color: Color(0xff265699),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: Color(0xff85C8F2).withOpacity(0.05),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: BorderSide(
        color: Color(0xff1BA0F2),
      ),
    ),
    margin: EdgeInsets.all(15),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(4),
    ),
  ),
);

var mainTextStyle = TextStyle(
  color: Color(0xff265699),
  letterSpacing: 1,
);

var accentTextStyle = TextStyle(
  color: Colors.white,
);

var grdientData = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff1BA0F2),
      Color(0xff265699),
    ],
  ),
);

var categoryGradientData = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff1BA0F2),
      Color(0xff265699),
    ],
  ),
);

var inputDeco = InputDecorationTheme(
  alignLabelWithHint: true,
  filled: true,
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xff1BA0F2),
    ),
    borderRadius: BorderRadius.circular(2.0),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(4.0),
  ),
);
