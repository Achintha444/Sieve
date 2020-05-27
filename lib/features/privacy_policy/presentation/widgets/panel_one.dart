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
          return ListTile(
            leading: Icon(
              Icons.lens,
              size: 10,
              color: Theme.of(context).primaryColor.withOpacity(0.9),
            ),
            title: Text(
              list[index],
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
