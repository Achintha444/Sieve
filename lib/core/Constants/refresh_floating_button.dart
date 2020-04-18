import 'package:flutter/material.dart';

class RefreshFloatingButton extends StatelessWidget {

  final Function onTap;

  const RefreshFloatingButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: ()=>this.onTap(context),
      backgroundColor: Colors.white,
      elevation: 4,
      child: Icon(
        Icons.refresh,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
      tooltip: 'refresh the content',
    );
  }

}