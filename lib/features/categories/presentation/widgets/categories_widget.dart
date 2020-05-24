import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/categories.dart';
import 'app_card.dart';
import 'categories_card.dart';

class CategoriesWidget extends StatelessWidget {
  final LoginUser user;
  final List<Categories> news;

  const CategoriesWidget({Key key, @required this.user, @required this.news})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesign(
        user: user,
      ),
      appBar: AppBarDesign(
        title: 'Categories',
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
                  this.news.length,
                      (index) {
                    print (this.news.length);
                    print (this.news[index].getTitle);
                    print(index);
                    return AppCard(
                      user: this.user,
                      title: this.news[index].getTitle,
                      desc: this.news[index].getDesc,
                      link: this.news[index].getFullLink,
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
                            this.news.length,
                                (index) {
                              print (this.news.length);
                              print (this.news[index].getTitle);
                              print(index);
                              return CategoriesCard(
                                title: this.news[index].getTitle,
                                desc: this.news[index].getDesc,
                                link: this.news[index].getFullLink,
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