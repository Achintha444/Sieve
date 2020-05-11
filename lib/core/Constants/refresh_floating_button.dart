import 'package:flutter/material.dart';

class RefreshFloatingButton extends StatefulWidget {
  final Function onTap;

  const RefreshFloatingButton({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  @override
  _RefreshFloatingButtonState createState() => _RefreshFloatingButtonState();
}

class _RefreshFloatingButtonState extends State<RefreshFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 30),
          key: Key('login'),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInQuint,
          builder: (BuildContext context, double size, Widget child) {
            return Container(
              height: size*2,
              width: size*2,
              child: FloatingActionButton(
                onPressed: () => this.widget.onTap(context),
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 4,
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: size,
                ),
                tooltip: 'refresh the content',
              ),
            );
          },
        ),
      ),
    );
  }
}
