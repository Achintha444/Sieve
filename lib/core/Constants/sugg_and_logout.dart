import 'package:flutter/material.dart';

import '../../features/login_screen/domain/entities/login_user.dart';
import '../../features/suggestion/presentation/pages/suggestion.dart';

class SuggAndLogout extends StatelessWidget {
  final String title;
  final IconData icon;
  final LoginUser user;

  SuggAndLogout({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('gestureDetector_sugg_and_logout'),
      onTap: () {
        _suggestionOnTap(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 48,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 1.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _suggestionOnTap(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Suggestion(user: user)));
  }
}
