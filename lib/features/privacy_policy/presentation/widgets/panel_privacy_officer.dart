import 'package:flutter/material.dart';
import '../../../categories/domain/entities/apps.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import 'email_send_widget.dart';

class PanelPrivacyOfficer extends StatelessWidget {
  final LoginUser user;
  final String contactLink;
  final String email;
  final String fiLine;
  final String sLine;
  final String tLine;
  final String foLine;
  final App app;

  const PanelPrivacyOfficer(
      {Key key,
      @required this.user,
      @required this.contactLink,
      @required this.email,
      @required this.fiLine,
      @required this.sLine,
      @required this.tLine,
      @required this.foLine,
      @required this.app})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Builder(
          builder: (context) {
            if (email != null || contactLink != null || fiLine != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Having any problems related to the privacy policy of " +
                          app.getName +
                          " ?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  //* email
                  Builder(
                    builder: (context) {
                      if (email != null) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              this._sendEmail(context);
                            },
                            child: Text(
                              "Click here to send an email to " +
                                  app.getName +
                                  " about it",
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      }
                    },
                  ),
                  //* contact link
                  Builder(
                    builder: (context) {
                      if (contactLink != null && contactLink.isNotEmpty) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              this._launchInWebViewWithDomStorage(
                                  contactLink, context);
                            },
                            child: Text(
                              "Click here to send a message through " +
                                  app.getName +
                                  "'s website",
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      }
                    },
                  ),
                  //* snail mail
                  Builder(
                    builder: (context) {
                      if (fiLine != null) {
                        return Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'Contact through snail mail',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.lerp(Alignment.centerLeft,
                                  Alignment.centerRight, 0.3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    fiLine,
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 17,
                                      //fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (sLine != null) {
                                        return Text(
                                          sLine,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 17,
                                            //fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        );
                                      } else {
                                        return Container(height: 0, width: 0);
                                      }
                                    },
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (tLine != null) {
                                        return Text(
                                          tLine,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 17,
                                            //fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        );
                                      } else {
                                        return Container(height: 0, width: 0);
                                      }
                                    },
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (foLine != null) {
                                        return Text(
                                          foLine,
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 17,
                                            //fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        );
                                      } else {
                                        return Container(height: 0, width: 0);
                                      }
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 15)),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      }
                    },
                  ),
                ],
              );
            } else {
              //* no privacy officer contacts available
              return Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No Privacy Officer contacts are available for " +
                          app.getName +
                          "!",
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }

  void _sendEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailSendWidget(user: user, email: email),
      ),
    );
  }

  Future<void> _launchInWebViewWithDomStorage(
      String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableDomStorage: true,
        universalLinksOnly: true,
        enableJavaScript: true,
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
