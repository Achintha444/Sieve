import 'package:flutter/material.dart';

import '../../features/login_screen/domain/entities/login_user.dart';

class Licences extends StatelessWidget {
  final String title;
  final IconData icon;
  final LoginUser user;

  Licences({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('gestureDetector'),
      onTap: () {
        _licencesOnTap(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor.withOpacity(0.75),
            size: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 1.5,
              color: Theme.of(context).primaryColor.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }

  _licencesOnTap(BuildContext context) async {
    showAboutDialog(
      context: context,
      applicationName: 'Sieve Data Privacy App',
      applicationVersion: '0.1.0',
      applicationLegalese:
          'The main objective of this application is to give an understanding to the user about data privacy and its importance.',
      applicationIcon:
          Image(image: AssetImage('icons/final_icon.png'), height: 50),
    );
  }
}
