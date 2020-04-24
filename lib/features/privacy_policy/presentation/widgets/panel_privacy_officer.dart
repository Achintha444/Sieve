import 'package:flutter/material.dart';

class PanelPrivacyOfficer extends StatelessWidget {
  final String contactLink;
  final String email;
  final String fiLine;
  final String sLine;
  final String tLine;
  final String foLine;

  const PanelPrivacyOfficer(
      {Key key,
      @required this.contactLink,
      @required this.email,
      @required this.fiLine,
      @required this.sLine,
      @required this.tLine,
      @required this.foLine})
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
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Have any problems related to Google's privacy policy ?",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //* email
                  Builder(
                    builder: (context) {
                      if (email == null) {
                        return ListTile(
                          title: Text(
                            'Click here to send an email to Google about it',
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
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
                        return ListTile(
                          title: Text(
                            "Click here to send a message through Google's website",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
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
                      if (fiLine != null && contactLink.isNotEmpty) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Contact through snail mail',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).accentColor,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600
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
                                  Padding(padding: EdgeInsets.only(top:18,bottom: 18)),
                                  
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
              return ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "NO Privacy Officer contacts are available for Google!",
                      style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                        bottom: 18,
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
}
