import 'package:flutter/material.dart';

class LoginScreenWidget extends StatelessWidget {
  
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
            Text('Login'.toUpperCase())
          ],
        ),
      ),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height,
  //     width: MediaQuery.of(context).size.width,
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           TweenAnimationBuilder(
  //             tween: Tween<double>(begin: 200, end: 130),
  //             duration: Duration(milliseconds: 900),
  //             builder: (BuildContext context, double size, Widget child) {
  //               return Text('LOGIN'.toUpperCase());
  //             },
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(
  //               top: 10,
  //               bottom: 10,
  //             ),
  //           ),
  //           Row(
  //             children: <Widget>[
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   left: 10,
  //                   right: 10,
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Container(
  //                   height: 45,
  //                   child: RaisedButton(
  //                     child: Text(
  //                       'SIGNUP',
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         letterSpacing: 2,
  //                       ),
  //                     ),
  //                     textColor: Theme.of(context).accentColor,
  //                     color: Colors.white,
  //                     elevation: 5,
  //                     shape: Theme.of(context).buttonTheme.shape,
  //                     onPressed: () {},
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   left: 10,
  //                   right: 10,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(
  //               top: 20,
  //               bottom: 20,
  //             ),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               FloatingActionButton(
  //                 heroTag: Key('google_loginscreen'),
  //                 child: Container(
  //                   height: 30,
  //                   key: Key('google_loginscreen'),
  //                   child: Image(
  //                     image: AssetImage('icons/google.png'),
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   _googleLoinFunction(context);
  //                 },
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(
  //                   left: 60,
  //                   right: 30,
  //                 ),
  //               ),
  //               FloatingActionButton(
  //                 heroTag: Key('fb_loginscreen'),
  //                 child: Container(
  //                   key: Key('fb_loginscreen'),
  //                   height: 50,
  //                   child: Image(
  //                     image: AssetImage('icons/facebook.png'),
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //                 onPressed: () {
  //                   _facebookLoginFunction(context);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


  // void _facebookLoginFunction(BuildContext context) {
  //   BlocProvider.of<LoginScreenBloc>(context).dispatch(
  //     GetFacebookLoginEvent()
  //   );
  // }

  // void _googleLoinFunction(BuildContext context) {
  //   BlocProvider.of<LoginScreenBloc>(context).dispatch(
  //     GetGoogleLoginEvent(),
  //   );
  // }


}
