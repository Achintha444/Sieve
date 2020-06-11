// import 'package:flutter/material.dart';
// import 'package:sieve_data_privacy_app/core/Constants/app_bar_design.dart';
// import 'package:sieve_data_privacy_app/core/Constants/drawer_design.dart';
// import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
// import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/pages/privacy_policy.dart';

// class Temp extends StatelessWidget {
//   final LoginUser user;

//   const Temp({Key key, @required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarDesign(title: 'TEST',imageUrl: user.getImageUrl,),
//       drawer: DrawerDesign(user: user),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Text(user.email),
//             //Text(user.password),
//             Text(user.getId),
//             RaisedButton(
//               child: Text('Uber'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
// //                    builder: (context) => PrivacyPolicy(user: user, appId: '1'),
//                   ),
//                 );
//               },
//             ),
//             RaisedButton(
//               child: Text('Facebook'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
// //                    builder: (context) => PrivacyPolicy(user: user, appId: '2'),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
