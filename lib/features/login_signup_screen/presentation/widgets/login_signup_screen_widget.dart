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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 150, end: 100),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double size, Widget child) {
                return Image(
                  key: Key('logo_image'),
                  image: AssetImage('icons/logo.png'),
                  height: size,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
