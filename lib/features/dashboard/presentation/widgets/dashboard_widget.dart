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
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'Dashboard',
        imageUrl: user.imageUrl,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //* Dashboard
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Data Privacy Intruseivess",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            Column(
              children: List.generate(
                this.dapp.length,
                (index) {
                  //return Column(children: _check_cat(index, context));
                  return _checkCat(index, context);
                },
              ),
            ),
            //* More Information
            Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkCat(int index, BuildContext context) {
    if ((index == 0) ||
        (dapp[index].categoryName != dapp[index - 1].categoryName)) {
      Padding cat = Padding(
        padding: EdgeInsets.only(left: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            dapp[index].categoryName + " Category",
            //textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      );

      DappCard dcard = DappCard(
          aName: this.dapp[index].getAppName,
          cName: this.dapp[index].getCategoryName,
          iconImage: this.dapp[index].getIconImage,
          dCount: this.dapp[index].getDCount);
      return Column (children: <Widget>[cat, dcard],) ;
    } else {
      DappCard dcard = DappCard(
          aName: this.dapp[index].getAppName,
          cName: this.dapp[index].getCategoryName,
          iconImage: this.dapp[index].getIconImage,
          dCount: this.dapp[index].getDCount);
      return dcard;
    }
  }

  // List<Widget> _check_cat(int index, BuildContext context) {
  //   if ((index == 0) ||
  //       (dapp[index].categoryName != dapp[index - 1].categoryName)) {
  //     Padding cat = Padding(
  //       padding: EdgeInsets.only(left: 15),
  //       child: Align(
  //         alignment: Alignment.centerLeft,
  //         child: Text(
  //           dapp[index].categoryName + " Category",
  //           //textAlign: TextAlign.end,
  //           style: TextStyle(
  //             fontSize: 22,
  //             color: Theme.of(context).primaryColor,
  //             fontWeight: FontWeight.bold,
  //             letterSpacing: 1,
  //           ),
  //         ),
  //       ),
  //     );

  //     DappCard dcard = DappCard(
  //         aName: this.dapp[index].getAppName,
  //         cName: this.dapp[index].getCategoryName,
  //         iconImage: this.dapp[index].getIconImage,
  //         dCount: this.dapp[index].getDCount);
  //     return [cat, dcard];
  //   } else {
  //     DappCard dcard = DappCard(
  //         aName: this.dapp[index].getAppName,
  //         cName: this.dapp[index].getCategoryName,
  //         iconImage: this.dapp[index].getIconImage,
  //         dCount: this.dapp[index].getDCount);
  //     return [dcard];
  //   }
  // }

}
