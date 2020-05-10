import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../injection_container.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/suggestion_bloc.dart';
import '../widgets/suggestion_widget.dart';

class Suggestion extends StatelessWidget {
  final LoginUser user;

  const Suggestion({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(title: 'Suggestions',imageUrl: user.getImageUrl,),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
    );
  }

  BlocProvider<SuggestionBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<SuggestionBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: _BlocListener(user: user,),
        ),
      ),
    );
  }
}

class _BlocListener extends StatelessWidget {
  final LoginUser user;

  const _BlocListener({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<SuggestionBloc>(context),
      listener: (context, state) {
        if (state is Loading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                  ),
                  Text(
                    'Sending'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 2,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).primaryColor,
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is InternetError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Internet Connection Failed'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              duration: Duration(seconds: 10),
              action: SnackBarAction(
                label: 'Close',
                textColor: Colors.white,
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        } else if (state is InvalidInputError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).errorColor,
              content: Text(
                'Email or Password is Incorrect'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 20),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
                textColor: Colors.white,
              ),
            ),
          );
        } else if (state is ServerError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Server Error\nTry Again!'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              duration: Duration(seconds: 10),
              action: SnackBarAction(
                label: 'Close',
                textColor: Colors.white,
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        } else if (state is Loaded) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Thank you for your Suggestion'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              duration: Duration(seconds: 10),
              action: SnackBarAction(
                label: 'Close',
                textColor: Colors.white,
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      },
      child: SuggestionWidget(user: user),
    );
  }
}
