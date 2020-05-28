import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class PrivacyPolicyCard extends StatefulWidget {
  final LoginUser user;
  final String title;
  final String subtitle;
  final Object content;

  PrivacyPolicyCard(
      {Key key, @required this.user, @required this.title, @required this.content, @required this.subtitle})
      : super(key: key);

  expandedChild() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Card(
        borderOnForeground: true,
        margin: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 5,
            bottom: 5
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              content
            ],
          ),
        ),
      )
    );
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 5,
          bottom: 5
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            content
          ],
        ),
      ),
    );
  }

  @override
  _PrivacyPolicyCardState createState() => _PrivacyPolicyCardState();
}

class _PrivacyPolicyCardState extends State<PrivacyPolicyCard> {
  bool isExpanded;
//  Widget collapsedChild;
//  Widget expandedChild;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column (
        children: <Widget> [
          Container (
            width: double.infinity,
            child: GestureDetector(
              child: Card(
                borderOnForeground: true,
                margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 5
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: <Widget>[
                      Column (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      Positioned (
                          right: 3.0,
                          child: Icon(
                              isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                              size: 35,
                              color: Theme.of(context).primaryColor
                          )
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),

          AnimatedContainer(
            width: double.infinity,
            duration: new Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isExpanded ? widget.expandedChild() : null,
          ),
        ]
    );
  }
}