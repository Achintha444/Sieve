import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/apps.dart';
import 'app_card.dart';

class AppsWidget extends StatelessWidget {
  final LoginUser user;
  final List<Apps> apps;

  const AppsWidget({Key key, @required this.user, @required this.apps})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'Apps',
        imageUrl: user.getImageUrl,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              //! SELECT A CATEGORY --*
              Column(
                children: List.generate(
                  this.apps.length,
                      (index) {
                    return AppCard(
                      user: this.user,
                      id: this.apps[index].getID,
                      name: this.apps[index].getName,
                      icon: this.apps[index].getIcon,
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height / 2.7,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select a Category'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            this.apps.length,
                                (index) {
                              return AppCard(
                                id: this.apps[index].getID,
                                name: this.apps[index].getName,
                                icon: this.apps[index].getIcon,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  //! --*
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Apps on the category'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}