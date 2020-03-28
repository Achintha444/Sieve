import 'package:flutter/material.dart';

class LoginSignupScreenWidget extends StatefulWidget {
  @override
  _LoginSignupScreenWidgetState createState() =>
      _LoginSignupScreenWidgetState();
}

class _LoginSignupScreenWidgetState extends State<LoginSignupScreenWidget> {
  int _sizeImage = 150;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2));
    this._sizeImage = 50;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: <Widget>[


             TweenAnimationBuilder(
               
                          child: Image(
                key: Key('logo_image'),
                image: AssetImage('icons/logo.png'),
                height: this._sizeImage.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
