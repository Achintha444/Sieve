import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/laws.dart';
import 'laws_card.dart';

class PrivacyLawsWidget extends StatelessWidget {
  final LoginUser user;
  final List<Laws> laws;

  const PrivacyLawsWidget({Key key, @required this.user, @required this.laws})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'Privacy Laws',
        imageUrl: user.getImageUrl,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //* Laws
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15,bottom: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Privacy Laws Implemented across the Globe',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),
            //! Laws CARD
            
            Column(
              children: List.generate(
                this.laws.length,
                (index) {
                  print(index);
                  return LawsCard(
                    title: this.laws[index].getLaw,
                    desc: this.laws[index].getDesc,
                    link: this.laws[index].getFullLink,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
