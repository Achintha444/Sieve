import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 2,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 8,
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}