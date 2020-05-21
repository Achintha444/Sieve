import 'package:flutter/material.dart';

class SearchFloatingButton extends StatefulWidget {

  const SearchFloatingButton({
    Key key,
  }) : super(key: key);

  @override
  _SearchFloatingButtonState createState() => _SearchFloatingButtonState();
}

class _SearchFloatingButtonState extends State<SearchFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 30),
          key: Key('app-search'),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInQuint,
          builder: (BuildContext context, double size, Widget child) {
            return Container(
              height: size * 2,
              width: size * 2,
              child: FloatingActionButton(
                key: Key('search'),
                heroTag: 'search',
                onPressed: _dispatchEvent,
                backgroundColor: Theme.of(context).accentColor,
                elevation: 4,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: size,
                ),
                tooltip: 'search an app',
              ),
            );
          },
        ),
      ),
    );
  }

  void _dispatchEvent() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => AppSearch(),
    //   ),
    // );
  }
}
