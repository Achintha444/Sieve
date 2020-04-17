import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/suggestion_bloc.dart';

class SuggestionWidget extends StatefulWidget {
  final LoginUser user;

  const SuggestionWidget({Key key, @required this.user}) : super(key: key);

  @override
  _SuggestionWidgetState createState() => _SuggestionWidgetState();
}

class _SuggestionWidgetState extends State<SuggestionWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  String _suggestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          //* Title
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10),
            child: Text(
              'Suggestions are always welcome!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
          //*  Suggestion and Button
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                //* Suggestion
                Padding(
                  padding: const EdgeInsets.only(
                      top: 45.0, left: 15, right: 15, bottom: 50),
                  child: TextFormField(
                    autofocus: true,
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    validator: (value) {
                      return _suggestionValidator(value);
                    },
                    onChanged: (value) {
                      this._suggestion = value;
                    },
                    maxLines: 13,
                  ),
                ),
                //* Button
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        key: Key('login_button'),
                        height: 45,
                        child: RaisedButton(
                          child: Text(
                            'SEND SUGGESTION',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 2,
                              wordSpacing: 3,
                            ),
                          ),
                          textColor: Colors.white,
                          elevation: 5,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            this._sendFunction(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _suggestionValidator(String suggestion) {
    if (suggestion.isEmpty) {
      return 'Suggestions Cannot be Empty Right 😉';
    }
    return null;
  }

  void _sendFunction(BuildContext context) {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      BlocProvider.of<SuggestionBloc>(context).dispatch(
        SentSuggestionEvent(
          loginUser: widget.user,
          suggestion: _suggestion,
        ),
      );
      _controller.clear();
    }
  }
}
