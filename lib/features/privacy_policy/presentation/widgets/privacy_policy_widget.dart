import 'package:flutter/material.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/privacy_policy.dart';
import 'privacy_policy_card.dart';
import 'panel_one.dart';
import 'panel_privacy_officer.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final LoginUser user;
  //TODO : HERE it should passes the App() object, for now it uses a Strnig.
  final String appId;
  final PrivacyPolicy privacyPolicy;

  const PrivacyPolicyWidget(
      {Key key,
      @required this.user,
      @required this.appId,
      @required this.privacyPolicy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GOOGLE'.toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        //* user_image
        actions: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'icons/user_placeholder.png',
              image: 'https://i.imgur.com/BoN9kdC.png',
              fit: BoxFit.fill,
              width: 50,
              height: 50,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: MediaQuery.of(context).size / 4,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 5.5,
                child: Card (
                  color: Color(0xffffff).withOpacity(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color: Color(0xff1BA0F2),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 0,
                    bottom: 15
                  ),
                  borderOnForeground: true,
                  child: Row(
                    children: <Widget>[
                      Card (
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Color(0xff1BA0F2),
                          ),
                        ),
                        child: Container (
                          padding: EdgeInsets.all(12),
                          child: Image(
                            image: AssetImage('icons/g.png'),
                            height: 80,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'One Of the Biggest Social Media Platform',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17.5,
                            letterSpacing: 1.5,
                            wordSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container (
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: 5
                ),
                child:Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Simplifed Privacy Policy'.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 1.3,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: 10
          ),
          child: Column(
            children: [
              PrivacyPolicyCard(
                user: user,
                title: "Data Types Collected",
                subtitle: "Eg: Name, Email",
                content: PanelOne(list: privacyPolicy.getTypes),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Data Usage Policy",
                subtitle: "Eg: Name, Email",
                content: PanelOne(list: privacyPolicy.getUsages),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Data Removal Policy",
                subtitle: "Eg: Name, Email",
                content: PanelOne(list: privacyPolicy.getRemoval),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Privacy Officer Contact",
                subtitle: "Contact Details of Privacy Officer",
                content: PanelPrivacyOfficer(
                  contactLink: privacyPolicy.contactLink,
                  email: privacyPolicy.email,
                  fiLine: privacyPolicy.fiLine,
                  sLine: privacyPolicy.sLine,
                  tLine: privacyPolicy.tLine,
                  foLine: privacyPolicy.foLine,
                  user: user,
                ),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Full Privacy Policy",
                subtitle: "Eg: Name, Email",
                content: ListView(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
