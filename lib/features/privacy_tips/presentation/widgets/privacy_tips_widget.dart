import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/tips.dart';
import 'tips_card.dart';
import 'visit_card.dart';

class PrivacyTipsWidget extends StatelessWidget {
  final LoginUser user;
  final List<Tips> tips;

  const PrivacyTipsWidget({Key key, @required this.user, @required this.tips})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        email: user.email,
      ),
      appBar: AppBarDesign(
        title: 'Privacy Tips',
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //* TIPS
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tips to Protect Your Privacy',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),
            //! TIPS CARD
            
            Column(
              children: List.generate(
                this.tips.length,
                (index) {
                  print (this.tips.length);
                  print (this.tips[index].getTitle);
                  print(index);
                  return TipsCard(
                    title: this.tips[index].getTitle,
                    desc: this.tips[index].getDesc,
                  );
                },
              ),
            ),
            //* More Information
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'For More Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ),

            VistCard(
              links: [
                'https://www.cbc.ca/news/technology/protecting-your-privacy-online-how-to-manage-what-you-reveal-1.3920036',
                'https://www.youtube.com/watch?v=QgwSz6PUxKo',
                'https://www.youtube.com/watch?v=xx1AUupLn2w&t=978s'
              ],
            ),
          ],
        ),
      ),
    );
  }
}
