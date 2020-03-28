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
              tween: Tween<double>(begin: 200, end: 130),
              duration: Duration(milliseconds: 750),
              builder: (BuildContext context, double size, Widget child) {
                return Image(
                  key: Key('logo_image'),
                  image: AssetImage('icons/logo.png'),
                  height: size,
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 40,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    child: RaisedButton(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      textColor: Theme.of(context).accentColor,
                      elevation: 5,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    child: RaisedButton(
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      textColor: Theme.of(context).accentColor,
                      color: Colors.white,
                      elevation: 5,
                      shape: Theme.of(context).buttonTheme.shape,
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
                Text(
                  'Login With'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  child: Image(
                    image: AssetImage('icons/google.png'),
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 30,
                  ),
                ),
                FloatingActionButton(onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
