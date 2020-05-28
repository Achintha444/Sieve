import 'package:flutter/material.dart';

class PanelOne extends StatelessWidget {
  final List<String> list;

  const PanelOne({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        list.length,
        (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 0,
                  right: 15,
                  top: 5,
                  bottom: 10
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
            ],
          );
        },
      ),
    );
  }
}
