import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSendWidgetBody extends StatelessWidget {
  final String email;


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = new TextEditingController();
  final TextEditingController _bodyController = new TextEditingController();
  String _subject;
  String _body;

  EmailSendWidgetBody({Key key, @required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //* Title
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10),
            child: Text(
              'Send an email to the privacy officer',
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
                //* Subject
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 45.0,
                      left: 15,
                      right: 15,
                      bottom: 2,
                    ),
                    child: Text(
                      'Subject',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          wordSpacing: 2),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, left: 15, right: 15, bottom: 10),
                  child: TextFormField(
                    autofocus: true,
                    controller: _subjectController,
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
                      return _subjectValidator(value);
                    },
                    onChanged: (value) {
                      this._subject = value;
                    },
                    maxLines: 2,
                  ),
                ),
                //* Body
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 15,
                      right: 15,
                      bottom: 2,
                    ),
                    child: Text(
                      'Body',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        wordSpacing: 2,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 2.0, left: 15, right: 15, bottom: 50),
                  child: TextFormField(
                    autofocus: true,
                    controller: _bodyController,
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
                      return _bodyValidator(value);
                    },
                    onChanged: (value) {
                      this._body = value;
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
                            'SEND EMAIL',
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
                            this._sendFunction(context, this.email);
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
                Padding(padding: EdgeInsets.only(bottom: 50)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _subjectValidator(String suggestion) {
    if (suggestion.isEmpty) {
      return 'Subject Cannot be Empty !';
    }
    return null;
  }

  String _bodyValidator(String suggestion) {
    if (suggestion.isEmpty) {
      return 'Emails Cannot be Empty Right 😉';
    }
    return null;
  }

  Future<void> _sendFunction(BuildContext context, String email) async {
    if (_formKey.currentState.validate()) {
      var emailaddress = 'mailto:$email?subject=$_subject&body=$_body';

      if (await canLaunch(emailaddress)) {
        await launch(emailaddress).whenComplete(
          () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Email Sent Successfully!'.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                duration: Duration(seconds: 120),
                action: SnackBarAction(
                  label: 'Close',
                  textColor: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).hideCurrentSnackBar();
                  },
                ),
              ),
            );
            _subjectController.clear();
            _bodyController.clear();
          },
        );
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Something went wrong\nTry again'.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            duration: Duration(seconds: 6),
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
    }
  }
}
