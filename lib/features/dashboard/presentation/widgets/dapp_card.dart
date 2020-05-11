import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DappCard extends StatelessWidget {
  final String aName;
  final String cName;
  final String iconImage;
  final int dCount;

  const DappCard(
      {Key key, @required this.aName, @required this.cName, @required this.iconImage, @required this.dCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Card(
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //* Dapp
              Text(
                aName,
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
                  top: 7,
                  bottom: 7,
                ),
              ),

              //* law description
              Text(
                cName,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,

                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 7,
                  bottom: 7,
                ),
              ),

              GestureDetector(
                onTap: () async=>await this._launchInWebViewWithDomStorage(iconImage, context),
                child: Text(
                  'view the full description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInWebViewWithDomStorage(String url,BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
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