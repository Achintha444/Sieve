import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/presentation/pages/login_signup_screen.dart';

import '../../features/login_screen/data/datasources/login_screen_local_datasource.dart';
import '../../injection_container.dart';

class SuggAndLogout extends StatelessWidget {
  final String title;
  final IconData icon;

  final LoginScreenLocalDataSource _loginScreenLocalDataSource =
      sl<LoginScreenLocalDataSource>();

  SuggAndLogout({
    Key key,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'suggestions') {
          _suggestionOnTap(context);
        } else {
          _logoutOnTap(context);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 45,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 23,
              letterSpacing: 1.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _suggestionOnTap(BuildContext context) {
    print('bbbb');
  }

  _logoutOnTap(BuildContext context) async {
    await this._loginScreenLocalDataSource.removeCacheLoginUser();
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> LoginSignupScreen()),
      (Route<dynamic> route) => false,
    );

  }
}
