import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PanelFullLink extends StatelessWidget {
  final String link;

  const PanelFullLink({Key key, @required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(link);
    if (link != null) {
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click the link below to view the full privacy policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).accentColor,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
              child: Text(
                'full link',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.3,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              elevation: 0,
              onPressed: () {
                _launchInWebViewWithDomStorage(link, context);
              },
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No details available!",
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
