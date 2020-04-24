import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';

class PrivacyPolicyWidget extends StatefulWidget {

  final LoginUser user;
  final PrivacyPolicy privacyPolicy;

  PrivacyPolicyWidget({Key key, @required this.user, @required this.privacyPolicy}) : super(key: key);

  @override
  _PrivacyPolicyWidgetState createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  //List<Item> _data = generateItems(8);
  List<bool> _expanded = [false, false, false, false, false];
  final testData = ["Example1", "Example2", "Example3", "Example100"];

  @override
  Widget build(BuildContext context) {
    final _markDownData =
        testData.map((x) => "- $x\n").reduce((x, y) => "$x$y");

    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(_markDownData),
      ),
    );
  }

  Widget _buildPanel(String markDownData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _expanded[index] = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                //decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: ListTile(
                  title: Text(
                    'Data Type Collected',
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
            canTapOnHeader: true,
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.bookmark,
                    size: 20,
                  ),
                  title: Text(
                    'Uber retains user profile, transaction, and other personal data for as long as a user maintains their Uber account',
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      size: 20,
                    ),
                    title: Text(
                        'Uber retains user profile, transaction, and other personal data for as long as a user maintains their Uber account')),
                ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      size: 20,
                    ),
                    title: Text(
                        'Uber retains user profile, transaction, and other personal data for as long as a user maintains their Uber account')),
                ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      size: 20,
                    ),
                    title: Text('Ip Address')),
                ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      size: 20,
                    ),
                    title: Text('Ip Address')),
                ListTile(
                    leading: Icon(
                      Icons.bookmark,
                      size: 20,
                    ),
                    title: Text('Ip Address')),
              ],
            ),
            isExpanded: _expanded[0],
          ),
          
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                //decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: ListTile(
                  title: Text(
                    'Data Usage Policy',
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
            canTapOnHeader: true,
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
              ],
            ),
            isExpanded: _expanded[1],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                //decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: ListTile(
                  title: Text(
                    'Data Removal Policy',
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
            canTapOnHeader: true,
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
              ],
            ),
            isExpanded: _expanded[1],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                //decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: ListTile(
                  title: Text(
                    'Privacy Officer Contact',
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
            canTapOnHeader: true,
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
              ],
            ),
            isExpanded: _expanded[1],
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                //decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: ListTile(
                  title: Text(
                    'Link to the Policy',
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              );
            },
            canTapOnHeader: true,
            body: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
                ListTile(
                  title: Text('Ip Address'),
                ),
              ],
            ),
            isExpanded: _expanded[1],
          ),
        ],
      ),
    );
  }
}
