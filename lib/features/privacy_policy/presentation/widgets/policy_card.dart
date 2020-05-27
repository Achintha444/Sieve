import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/panel_one.dart';

class PolicyCard extends StatefulWidget {

  final LoginUser user;
  final PrivacyPolicy privacyPolicy;

  PolicyCard(
      {Key key, @required this.user, @required this.privacyPolicy})
      : super(key: key);

  expandedChild() {
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
            PanelOne(list: privacyPolicy.getTypes)
          ],
        ),
      ),
    );
  }

  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
  bool isExpanded;
  Widget collapsedChild;
  Widget expandedChild;

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
                          'Data Type Collected',
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
                          'Eg: Name, Email',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
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