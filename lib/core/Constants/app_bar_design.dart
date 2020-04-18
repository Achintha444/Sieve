import 'package:flutter/material.dart';

class AppBarDesign extends StatelessWidget implements PreferredSizeWidget {
  static final AppBar appBar = new AppBar();

  final String title;

  const AppBarDesign({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        this.title.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 25,
          letterSpacing: 2,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      //* user_image
      actions: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: FadeInImage.assetNetwork(
            placeholder: 'icons/user_placeholder.png',
            image: 'https://i.imgur.com/BoN9kdC.png',
            fit: BoxFit.fill,
            width: 50,
            height: 50,
          ),
        ),
      ],
      
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
