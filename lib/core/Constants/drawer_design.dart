import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

import 'sugg_and_logout.dart';

class DrawerDesign extends StatelessWidget {
  final LoginUser user;

  DrawerDesign({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('drawer'),
      elevation: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //* Close Button
            Align(
              alignment: Alignment.lerp(
                  Alignment.centerRight, Alignment.centerLeft, 0.10),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 40,
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
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
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: ClipRRect(
                    key: Key('user_image'),
                    borderRadius: BorderRadius.circular(50.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'icons/user_placeholder.png',
                      image: 'https://i.imgur.com/BoN9kdC.png',
                      fit: BoxFit.fill,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
            ),
            //* Email
            Align(
              alignment: AlignmentGeometry.lerp(
                  Alignment.centerLeft, Alignment.center, 0.2),
              key: Key('user_email'),
              child: Text(
                user.email,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              thickness: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.2),
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
            SuggAndLogout(
              title: 'logout',
              icon: Icons.do_not_disturb_on,
              user:user,
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
