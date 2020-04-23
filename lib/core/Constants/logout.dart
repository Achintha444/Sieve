import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import '../../features/login_signup_screen/presentation/pages/login_signup_screen.dart';
import '../../features/suggestion/presentation/pages/suggestion.dart';

import '../../features/login_screen/data/datasources/login_screen_local_datasource.dart';
import '../../injection_container.dart';

class Logout extends StatelessWidget {
  final String title;
  final IconData icon;
  final LoginUser user;

  final LoginScreenLocalDataSource _loginScreenLocalDataSource =
      sl<LoginScreenLocalDataSource>();

  Logout({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _logoutOnTap(context);
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

  _logoutOnTap(BuildContext context) async {
    await this._loginScreenLocalDataSource.removeCacheLoginUser();
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginSignupScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
