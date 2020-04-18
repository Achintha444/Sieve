import 'package:flutter/material.dart';
import 'package:link_previewer/link_previewer.dart';
import 'package:url_launcher/url_launcher.dart';

class VistCard extends StatelessWidget {
  final List<String> links;

  const VistCard({Key key, @required this.links}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
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
              Text(
                'Visit',
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
              //_linkPreveiew(links,context),
              Column(
                children: List.generate(
                  this.links.length,
                  (index) {
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => this._launchInWebViewWithDomStorage(
                              links[index], context),
                          child: AbsorbPointer(
                            absorbing: true,
                            child: LinkPreviewer(
                              link: links[index],
                              titleFontSize: 10,
                              borderColor: Theme.of(context).accentColor,
                              defaultPlaceholderColor: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.5),
                              borderRadius: 4,
                              bodyMaxLines: 2,
                              bodyTextOverflow: TextOverflow.ellipsis,
                              bodyFontSize: 6,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
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
