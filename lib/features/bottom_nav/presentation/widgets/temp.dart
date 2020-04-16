import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class Temp extends StatelessWidget {

  final LoginUser user;

  const Temp({Key key, @required this.user}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(user.email),
            Text(user.password),
          ],
        ),
      ),
    );
  }
}