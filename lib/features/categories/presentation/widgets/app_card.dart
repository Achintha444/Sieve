import 'package:flutter/material.dart';
import '../../domain/entities/apps.dart';
import '../../../privacy_policy/presentation/pages/privacy_policy.dart';
import '../../../login_screen/domain/entities/login_user.dart';

class AppCard extends StatelessWidget {
  final LoginUser user;
  final App app;
  const AppCard(
      {Key key, @required this.user, @required this.app})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.8,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: NetworkImage(app.getBG),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor.withOpacity(0.5),
            BlendMode.multiply,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: NetworkImage(app.getIcon),
                    height: 80,
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicy(user: user, app: app),
                      ),
                    );
                  },
                  tooltip: 'Go to the App Page',
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 7,
                bottom: 7,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                app.getName.toUpperCase(),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                app.getDesc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  letterSpacing: 0.4,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
