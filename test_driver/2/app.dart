import 'package:flutter_driver/driver_extension.dart';
import 'package:sieve_data_privacy_app/features/login_screen/presentation/pages/login_screen.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/presentation/pages/signp_screen.dart';
import 'package:sieve_data_privacy_app/injection_container.dart';
import 'package:sieve_data_privacy_app/core/Constants/theme_data.dart' as td;
//import 'package:sieve_data_privacy_app/main.dart' as app;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async{
  // This line enables the extension.
  enableFlutterDriverExtension();

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Sieve',
      theme: td.themeData,
      home: SignupScreen(),
      routes: {
        '/loginScreen': (context) => new LoginScreen(),
        '/signupScreen': (context) => new SignupScreen(),
      },
    );
  }
}
