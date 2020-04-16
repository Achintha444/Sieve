import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {

  final String title;
  final String desc;

  const TipsCard({Key key, @required this.title, @required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
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
                title,
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
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}