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
