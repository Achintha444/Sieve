import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/theme_data.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../../privacy_policy/presentation/pages/privacy_policy.dart';
import '../../../suggestion/presentation/pages/suggestion.dart';
import '../../domain/entities/apps.dart';

class SearchWidget extends StatefulWidget {
  final LoginUser user;
  final List<App> apps;

  const SearchWidget({Key key, @required this.user, @required this.apps})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final SearchBarController<App> _searchBarController = SearchBarController();

  Future<List<App>> _getAllApps(String text) async {
    await Future.delayed(Duration(milliseconds: 750));
    List<App> apps = [];
    for (int i = 0; i < widget.apps.length; i++) {
      if (widget.apps[i].getName.toLowerCase().contains(text.toLowerCase())) {
        apps.add(widget.apps[i]);
      }
    }
    return apps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(
        title: 'Search App',
        imageUrl: widget.user.getImageUrl,
      ),
      body: SafeArea(
        child: SearchBar<App>(
          suggestions: widget.apps,
          searchBarStyle: SearchBarStyle(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          iconActiveColor: themeData.accentColor,
          hintText: 'Search an app to view privacy policy',
          hintStyle: TextStyle(
            color: themeData.accentColor.withOpacity(0.75),
            fontSize: 13.5,
          ),
          textStyle: TextStyle(color: themeData.accentColor),
          loader: LoadingWidget(),
          searchBarPadding: EdgeInsets.symmetric(horizontal: 12),
          headerPadding: EdgeInsets.symmetric(horizontal: 2),
          onSearch: _getAllApps,
          searchBarController: _searchBarController,
          placeHolder: PlaceHolder(
            apps: widget.apps,
            user: widget.user,
          ),
          cancellationWidget: Center(
            child: Text(
              "Cancel",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
          emptyWidget: Empty(
            user: widget.user,
          ),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          onItemFound: (App app, int index) {
            return AppCard1(
              imageLocation: app.getIcon,
              name: app.getName,
              app: app,
              user: widget.user,
            );
          },
        ),
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {
  final List<App> apps;
  final LoginUser user;

  const PlaceHolder({Key key, @required this.apps, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          apps.length,
          (index) {
            print(apps.length);
            print(apps[index].getName);
            print(index);
            return AppCard1(
              name: apps[index].getName,
              imageLocation: apps[index].getIcon,
              app: apps[index],
              user: user,
            );
          },
        ),
      ),
    );
  }
}

class AppCard1 extends StatelessWidget {
  final String imageLocation;
  final String name;
  final LoginUser user;
  final App app;

  const AppCard1(
      {Key key,
      @required this.imageLocation,
      @required this.name,
      @required this.user,
      @required this.app})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this._navigatePrivacyPolicy(context, user, app);
      },
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.4,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Image(
                      alignment: Alignment.centerRight,
                      image: NetworkImage(
                        imageLocation,
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigatePrivacyPolicy(BuildContext context, LoginUser user, App app) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivacyPolicy(
          user: user,
          app: app,
        ),
      ),
    );
  }
}

class Empty extends StatelessWidget {
  final LoginUser user;

  const Empty({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                alignment: Alignment.centerRight,
                image: AssetImage(
                  'icons/404.png',
                ),
                height: MediaQuery.of(context).size.height / 3,
              ),
              Padding(padding: EdgeInsets.only(top: 15, bottom: 15)),
              Text(
                "Sorry no app found!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),
              Text(
                "Leave a suggestion about this app and we will get into it rightaway!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(padding: EdgeInsets.only(top: 9, bottom: 5)),
              RaisedButton(
                child: Text(
                  'SEND SUGGESTION',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    wordSpacing: 3,
                  ),
                ),
                textColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  this._navigateSuggestion(context, user);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateSuggestion(BuildContext context, LoginUser user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Suggestion(
          user: user,
        ),
      ),
    );
  }
}
