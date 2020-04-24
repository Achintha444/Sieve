import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/news.dart';
import 'news_card.dart';
import 'visit_card.dart';

class InterestingNewsWidget extends StatelessWidget {
  final LoginUser user;
  final List<News> news;

  const InterestingNewsWidget({Key key, @required this.user, @required this.news})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'NewsFeed',


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
                  'Interesting News About Data Privacy',
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
                this.news.length,
                    (index) {
                  print (this.news.length);
                  print (this.news[index].getTitle);
                  print(index);
                  return NewsCard(
                    title: this.news[index].getTitle,
                    desc: this.news[index].getDesc,
                    link: this.news[index].getFullLink,
                  );
                },
              ),
            ),
            //* More Information
          ],
        ),
      ),
    );
  }
}