import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/dapp.dart';
import 'dapp_card.dart';


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
                  top: 3.0, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(

                  "DATA PRIVACY INTRUSEIVENESS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme
                        .of(
                        context)
                        .primaryColor,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w200
                  ),
                ),



              ),
            ),


            Column(

              children: List.generate(
                this.dapp.length,
                    (index) {
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
                  top: 1.0, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,

              ),
            ),


          ],
        ),
      ),
    );
  }
}
