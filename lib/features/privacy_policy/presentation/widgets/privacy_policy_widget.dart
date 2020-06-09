import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../categories/domain/entities/apps.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/privacy_policy.dart';
import 'privacy_policy_card.dart';
import 'panel_one.dart';
import 'panel_privacy_officer.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final LoginUser user;
  final App app;
  final PrivacyPolicy privacyPolicy;

  const PrivacyPolicyWidget(
      {Key key,
      @required this.user,
      @required this.app,
      @required this.privacyPolicy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          app.getName.toUpperCase(),
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
              image: _imageUrl(),
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
                child: Card(
                  color: Color(0xffffff).withOpacity(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
                  borderOnForeground: true,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Image(
                          image: NetworkImage(app.getIcon),
                          height: 80,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          app.getDesc,
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
              Container(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                child: Align(
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
          padding: EdgeInsets.only(bottom: 10),
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
                subtitle: "What is data being used for",
                content: PanelOne(list: privacyPolicy.getUsages),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Data Removal Policy",
                subtitle: "What happens to data if app is deleted",
                content: PanelOne(list: privacyPolicy.getRemoval),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Privacy Officer Contact",
                subtitle: "Contact Details of Privacy Officer",
                content: PanelPrivacyOfficer(
                  user: user,
                  contactLink: privacyPolicy.contactLink,
                  email: privacyPolicy.email,
                  fiLine: privacyPolicy.fiLine,
                  sLine: privacyPolicy.sLine,
                  tLine: privacyPolicy.tLine,
                  foLine: privacyPolicy.foLine,
                  app: app,
                ),
              ),
              PrivacyPolicyCard(
                user: user,
                title: "Full Privacy Policy",
                subtitle: "Web link to Privacy Policy",
                content: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        if (app.getLink != null || app.getLink != "") {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async=>await this._launchInWebViewWithDomStorage(app.getLink, context),
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    app.getLink,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  "Not available",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ]
                          );
                        }
                      },
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

  String _imageUrl() {
    if (user.imageUrl == null) {
      return 'https://i.imgur.com/BoN9kdC.png';
    } else {
      return user.imageUrl;
    }
  }

  Future<void> _launchInWebViewWithDomStorage(String url,BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
        enableDomStorage: true,
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
