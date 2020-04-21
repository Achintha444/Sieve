import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/bottom_nav_bloc.dart';

class InternetErrorWidget extends StatelessWidget {

  final BottomNavEvent event;
  final LoginUser user;

  const InternetErrorWidget({Key key, @required this.event, @required this.user}) : super(key: key);
  

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
            Center(
              child: Text(
                'NO INTERNET'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 3,
                bottom: 3,
              ),
            ),
            Center(
              child: Text(
                'connection'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Center(
              child: Text(
                'Connect to internet and try again'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
            ),
            FloatingActionButton(
              child: Icon(
                Icons.replay,
                size: 30,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                _dispatchEvent(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    print ('assaas');
    BlocProvider.of<BottomNavBloc>(context).dispatch(
      event
    );
  }
}
