import 'package:flutter/material.dart';

class PanelOne extends StatelessWidget {
  final List<String> list;

  const PanelOne({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.length > 0) {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          list.length, (index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      right: 15,
                      top: 5
                  ),
                  child: Icon(
                    Icons.lens,
                    size: 10,
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                  ),
                ),
                Expanded(
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (index < list.length - 1) {
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom: 30
                          ));
                    } else {
                      return Container(
                        height: 0,
                        width: 0,
                      );
                    }
                  },
                )
              ],
            );
          },
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(
            top: 10,
            bottom: 10
        ),
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
}
