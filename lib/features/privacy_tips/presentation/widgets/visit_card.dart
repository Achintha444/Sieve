import 'package:flutter/material.dart';
import 'package:link_previewer/link_previewer.dart';

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
              LinkPreviewer(
                link: links[0],
                titleFontSize: 10,
                borderColor: Theme.of(context).accentColor,
                defaultPlaceholderColor:
                    Theme.of(context).accentColor.withOpacity(0.5),
                borderRadius: 4,
                bodyMaxLines: 2,
                bodyTextOverflow: TextOverflow.ellipsis,
                bodyFontSize: 6,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
              ),
              LinkPreviewer(
                link: links[1],
                titleFontSize: 10,
                borderColor: Theme.of(context).accentColor,
                placeholder: Container(
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: 4,
                bodyMaxLines: 2,
                defaultPlaceholderColor:
                    Theme.of(context).accentColor.withOpacity(0.5),
                bodyTextOverflow: TextOverflow.ellipsis,
                bodyFontSize: 6,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
              ),
              LinkPreviewer(
                link: links[2],
                titleFontSize: 10,
                borderColor: Theme.of(context).accentColor,
                placeholder: Container(
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: 4,
                bodyMaxLines: 2,
                defaultPlaceholderColor:
                    Theme.of(context).accentColor.withOpacity(0.5),
                bodyTextOverflow: TextOverflow.ellipsis,
                bodyFontSize: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
