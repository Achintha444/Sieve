import 'package:flutter/material.dart';

class DrawerDesign extends StatelessWidget {
  final String email;

  const DrawerDesign({Key key, @required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //* Close Button
            Align(
              alignment: Alignment.lerp(
                  Alignment.centerRight, Alignment.centerLeft, 0.10),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 40,
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                ),
                onPressed: () {
                  _closeDrawer(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),

            //* Image
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: ClipRRect(
                    key: Key('user_image'),
                    borderRadius: BorderRadius.circular(50.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'icons/user_placeholder.png',
                      image: 'https://i.imgur.com/BoN9kdC.png',
                      fit: BoxFit.fill,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
            ),
            //* Email
            Align(
              alignment: AlignmentGeometry.lerp(
                  Alignment.centerLeft, Alignment.center, 0.2),
              key: Key('user_email'),
              child: Text(
                email,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              thickness: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            //* Suggestion
            _suggAndLogout(
              context,
              'suggestions',
              Icons.flag,
              (){this._suggestionOnTap(context);},
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            //* Logout
            _suggAndLogout(
              context,
              'logout',
              Icons.do_not_disturb_on,
              (){this._logoutOnTap(context);},
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _suggAndLogout(
      BuildContext context, String title, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 45,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 23,
              letterSpacing: 1.5,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _suggestionOnTap(BuildContext context) {
    return null;
  }

  void _logoutOnTap(BuildContext context) {
    return null;
  }

  void _closeDrawer(BuildContext context) {
    Navigator.pop(context);
  }
}
