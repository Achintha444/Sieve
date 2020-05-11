import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/dapp.dart';

import 'dapp_card.dart';
//import 'visit_card.dart';

class DashboardWidget extends StatelessWidget {
  final LoginUser user;
  final List<Dapp> dapp;

  const DashboardWidget({Key key, @required this.user, @required this.dapp})
      : super(
      key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'Dashboard',


      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //* Dashboard
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dashboard',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme
                        .of(
                        context)
                        .primaryColor,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),
            //! TIPS CARD

            Column(
              children: List.generate(
                this.dapp.length,
                    (index) {
                  print(
                      this.dapp.length);
                  print(
                      this.dapp[index].getAppName);
                  print(
                      index);
                  return DappCard(
                      aName: this.dapp[index].getAppName,
                      cName: this.dapp[index].getCategoryName,
                      iconImage: this.dapp[index].getIconImage,
                      dCount: this.dapp[index].getDCount
                  );
                },
              ),
            ),
            //* More Information
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'For More Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme
                        .of(
                        context)
                        .primaryColor,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
