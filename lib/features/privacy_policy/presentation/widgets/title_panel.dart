import 'package:flutter/material.dart';

class TitlePanel extends StatelessWidget {
  final String title;

  const TitlePanel({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
