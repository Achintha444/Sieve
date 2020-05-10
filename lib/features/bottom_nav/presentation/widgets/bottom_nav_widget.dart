import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

import '../bloc/bottom_nav_bloc.dart';

class BottomNavWidget extends StatefulWidget {
  final LoginUser user;

  const BottomNavWidget({Key key, @required this.user}) : super(key: key);

  static BottomNavigationBarItem _navBarItem(String title, IconData icon) =>
      BottomNavigationBarItem(
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            key: Key(title),
          ),
        ),
        icon: Icon(icon),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      );

  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final List<BottomNavigationBarItem> _items = [
    BottomNavWidget._navBarItem('Category', Icons.category),
    BottomNavWidget._navBarItem('Dashboard', Icons.dashboard),
    BottomNavWidget._navBarItem('News Feed', Icons.library_books),
    BottomNavWidget._navBarItem('Privacy Tips', Icons.fingerprint),
    BottomNavWidget._navBarItem('Privacy Laws', Icons.language),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: BottomNavigationBar(
        key: Key('bottomNav'),
        onTap: (index) => _tapLogic(index, context),
        currentIndex: _currentIndex,
        items: this._items,
        backgroundColor: Colors.white,
        fixedColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 25,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 28,
        ),
        elevation: 0,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  _tapLogic(int index, BuildContext context) {
    if (index == 0) {
      BlocProvider.of<BottomNavBloc>(context)
          .dispatch(CategoryEvent(user: widget.user));
      this._setIndex(0);
    }
    if (index == 1) {
      BlocProvider.of<BottomNavBloc>(context)
          .dispatch(DashboardEvent(user: widget.user));
      this._setIndex(1);
    }
    if (index == 2) {
      BlocProvider.of<BottomNavBloc>(context)
          .dispatch(NewsFeedEvent(user: widget.user));
      this._setIndex(2);
    }
    if (index == 3) {
      BlocProvider.of<BottomNavBloc>(context)
          .dispatch(TipsEvent(user: widget.user));
      this._setIndex(3);
    }
    if (index == 4) {
      BlocProvider.of<BottomNavBloc>(context)
          .dispatch(LawsEvent(user: widget.user));
      this._setIndex(4);
    }
  }

  _setIndex(int index) {
    setState(() {
      this._currentIndex = index;
    });
  }
}
