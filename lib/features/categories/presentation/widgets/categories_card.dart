import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/Constants/theme_data.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final String desc;
  final String link;
  const CategoriesCard(
      {Key key, @required this.title, @required this.desc, @required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.3,
      width: MediaQuery.of(context).size.height / 4.3,
      alignment: Alignment.center,
      child: Card(
        elevation: 4,
        borderOnForeground: true,
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: categoryGradientData,
          child: Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SOCIAL MEDIA'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 12,
                  ),
                ),
                Icon(
                  Icons.people,
                  color: Colors.white,
                  size: 100,
                ),
              ],
            ),
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
