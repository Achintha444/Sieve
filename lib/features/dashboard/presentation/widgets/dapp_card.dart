import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class DappCard extends StatelessWidget {
  final String aName;
  final String cName;
  final String iconImage;
  final int dCount;

  const DappCard(
      {Key key, @required this.aName, @required this.cName, @required this.iconImage, @required this.dCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      height: MediaQuery.of(context).size.height / 5,
      //width: 100000,
      alignment: Alignment.centerLeft,
      child: Card(
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //* Dapp

              Image.network(
                iconImage,
                width: 50,
                height: 50,
              ),
              Text(
                aName,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),

              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 1,
                  bottom: 1,
                ),
              ),

              //* category Name
                Text(
                  cName,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 1,
                    bottom: 1,
                  ),
                ),


              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                 children:   _check_dashboard(dCount),
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,

              )

            ],
          ),
        ),
      ),
    );
  }

 // ignore: non_constant_identifier_names
 List _check_dashboard(int dCount) {

      int num=0;
      Color colour;
       if(dCount>=25){
         num=5;
         colour=Colors.red;
       }
       else if(dCount>=20 && dCount<=24){
         num=4;
         colour=Colors.red;
       }
       else if(dCount>=15 && dCount<=19){
         num=3;
         colour=Colors.yellow;
       }
       else if(dCount>=10 && dCount<=14){
         num=2;
         colour=Colors.yellow;

       }
       else if(dCount>=5 && dCount<=9){
         num=1;
         colour=Colors.blue;
       }

       else if(dCount>=0 && dCount<=4){
         num=0;
         //colour="yellow";
       }

     List app = <Icon>[];
     for (int j = 0; j <= num; j++) {

       Icon t = Icon(
         MdiIcons.fire,
         color: colour,
         size: 30.0,
       );
       app.add(t);
       t=null;

     }
     return app;
   }


}