import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//! Sieve Data Privacy App - Integration Testing

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  //* Splash screen to Login Screen Transistion
  group('Splash Screen to Login-Signup Screen Transition', () {
    final imageFinder = find.byValueKey('logo_image');
    final circularIndicator = find.byValueKey('circular_progress_indicator');

    final loginFinder = find.text('LOGIN');
    final signupFinder = find.text('SIGNUP');

    test('Find Sieve Logo and the Circular Progress Indicator', () async {
      assert(imageFinder != null);
      assert(circularIndicator != null);
    });

    // We cannot test the auto login function bacuase we cannot import SharedPreferences module

    test('Check if Login-Signup Transition is Successful', () async {
      expect(await driver.getText(loginFinder), 'LOGIN');
      expect(await driver.getText(signupFinder), 'SIGNUP');
    });
  });

  //* Login-Signup screen to Signup Screen Transistion
  group('Login-Signup Screen to Singup Screen Transition + LOGIN and SIGN UP GestureDetector Test', () {
    final loginFinder = find.text('LOGIN');
    final signupFinder = find.text('SIGNUP');
    final loginWithTextFinder = find.text('Login With'.toUpperCase());

    // Elements on the Signup Page
    final loginFinder1 = find.text('LOGIN');
    final text1Finder = find.text('Already HAVE AN ACCOUNT '.toUpperCase());
    final text2Finder = find.text(' NOW!'.toUpperCase());

    // Elements on the Login Page
    final signupFinder1 = find.text('SIGN UP');
    final text3Finder = find.text('DO NOT HAVE AN ACCOUNT '.toUpperCase());
    final text4Finder = find.text(' NOW!'.toUpperCase());


    test('Login-Singup Screen check', () async {
      expect(await driver.getText(loginFinder), 'LOGIN');
      expect(await driver.getText(signupFinder), 'SIGNUP');
      expect(await driver.getText(loginWithTextFinder),
          'Login With'.toUpperCase());
    });

    test('Check if Signup transistion is Successful', () async {
      await driver.tap(signupFinder);
      // Should navigate to the signup screen
      expect(await driver.getText(text1Finder),
          'Already HAVE AN ACCOUNT '.toUpperCase());
      expect(await driver.getText(loginFinder1), 'LOGIN'.toUpperCase());
      expect(await driver.getText(text2Finder), ' NOW!'.toUpperCase());
    });

    test(
        'Check LOGIN gesture detector is working and move back to the signup screen',
        () async {
      await driver.tap(loginFinder1);
      //should navigate to the login-signup screen
      await driver.waitFor(signupFinder1);
      expect(await driver.getText(signupFinder1), 'SIGN UP');
      expect(await driver.getText(text3Finder),'DO NOT HAVE AN ACCOUNT '.toUpperCase());
      expect(await driver.getText(text4Finder), ' NOW!'.toUpperCase());
      await driver.tap(signupFinder1);
      // Should navigate to the signup screen
      await driver.waitFor(text1Finder);
      expect(await driver.getText(text1Finder),
          'Already HAVE AN ACCOUNT '.toUpperCase());
      expect(await driver.getText(loginFinder), 'LOGIN'.toUpperCase());
      expect(await driver.getText(text2Finder), ' NOW!'.toUpperCase());
    });
  });
}
