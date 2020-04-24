import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/Constants/logout.dart';

import '../../features/login_screen/domain/entities/login_user.dart';
import '../util/input_converter.dart';
import 'sugg_and_logout.dart';

class DrawerDesign extends StatelessWidget {
  final InputConverter _inputConverter = new InputConverter();
  final LoginUser user;

  DrawerDesign({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('drawer'),
      elevation: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height / 2.6,
              child: Column(
                children: <Widget>[
                  //* Close Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      onPressed: () {
                        _closeDrawer(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                  ),

                  //* Image
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 105),
                    key: Key('login'),
                    duration: Duration(milliseconds: 380),
                    curve: Curves.easeInOut,
                    builder: (BuildContext context, double size, Widget child) {
                      return Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Container(
                            width: size,
                            height: size,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(60.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 6.0,
                              ),
                            ),
                            key: Key('user_image'),
                            child: ClipOval(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'icons/user_placeholder.png',
                                image: 'https://i.imgur.com/BoN9kdC.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                  ),
                  //* Email
                  Align(
                    alignment: Alignment.center,
                    key: Key('user_email'),
                    child: Text(
                      _inputConverter.getUsername(user.email),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 5,
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            //* Suggestion
            SuggAndLogout(
              title: 'suggestions',
              icon: Icons.flag,
              user: user,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            //* Logout
            Logout(
              title: 'logout',
              icon: Icons.do_not_disturb_on,
              user: user,
            ),
          ],
        ),
      ),
    );
  }

  void _closeDrawer(BuildContext context) {
    Navigator.pop(context);
  }
}
