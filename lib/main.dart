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
