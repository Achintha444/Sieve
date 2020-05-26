import 'package:flutter/material.dart';

import '../../../../core/Constants/app_bar_design.dart';
import '../../../../core/Constants/drawer_design.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/categories.dart';
import 'apps_widget.dart';
import 'categories_card.dart';

class CategoriesWidget extends StatefulWidget {
  final LoginUser user;
  final List<Categories> categories;

  const CategoriesWidget({Key key, @required this.user, @required this.categories})
      : super(key: key);

  @override
  CategoriesWidgetState createState() => CategoriesWidgetState();
}

class CategoriesWidgetState extends State<CategoriesWidget> {
  int categoryId;
  final ValueNotifier<int> _categoryId = ValueNotifier<int>(0);
//  final Widget goodJob = const Text('Good job!');

  initState() {
    categoryId = widget.categories[2].getID;
    _categoryId.value = widget.categories[2].getID;
  }

  @override
  Widget build(BuildContext context) {
//    rebuildAllChildren(context);
    return Scaffold(
      drawer: DrawerDesign(
        user: widget.user,
      ),
      appBar: AppBarDesign(
        title: 'Categories',
        imageUrl: widget.user.getImageUrl,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              ValueListenableBuilder(
                builder: (BuildContext context, int value, Widget child) {
                  return new AppsWidget(user: widget.user, categoryId: _categoryId.value);
                },
                valueListenable: _categoryId,
//                child: goodJob,
              )
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
                            widget.categories.length,
                                (index) {
                              return CategoriesCard(
                                id: widget.categories[index].getID,
                                name: widget.categories[index].getName,
                                icon: widget.categories[index].getIcon,
                                tapAction: (){
                                  categoryId = widget.categories[index].getID;
                                  _categoryId.value = categoryId;
                                  print (_categoryId.value);
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  //! --*
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 8.0),
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