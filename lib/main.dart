import 'package:flutter/material.dart';

import './core/Constants/theme_data.dart' as td;
import 'features/login_screen/presentation/pages/login_screen.dart';
import 'features/signup_screen/presentation/pages/signp_screen.dart';
import 'features/splash_screen/presentation/pages/splash_screen.dart';
import 'injection_container.dart';

Future main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sieve',
      theme: td.themeData,
      home: SplashScreen(),
      routes: {
        '/loginScreen': (context) => new LoginScreen(),
        '/signupScreen': (context) => new SignupScreen(),
      },
    );
  }
}

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Node server demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: Text('Flutter Client')),
//         body: BodyWidget(),
//       ),
//     );
//   }
// }

// class BodyWidget extends StatefulWidget {
//   @override
//   BodyWidgetState createState() {
//     return new BodyWidgetState();
//   }
// }

// class BodyWidgetState extends State<BodyWidget> {
//   String serverResponse = 'Server response';

//   @override
//   Widget build(BuildContext context) {

//     return Padding(
//       padding: const EdgeInsets.all(32.0),
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: SizedBox(
//           width: 200,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 child: Text('Send request to server'),
//                 onPressed: () {
//                   _makeGetRequest();
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(serverResponse),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _makeGetRequest() async {
//     Response response = await post('http://10.0.2.2:3000/user/login');
//     setState(() {
//       print (response);
//       serverResponse = json.decode(response.body)['email'];
//     });
//   }

//   // String _localhost() {
//   //   if (Platform.isAndroid)
//   //    // return Uri.http('http://10.0.2.2:3000', '/user/login');
//   //   else // for iOS simulator
//   //     return 'http://localhost:3000';
//   // }
// }