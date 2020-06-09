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
  group('Login-Signup Screen to Singup Screen Transition', () {
    final loginFinder = find.text('LOGIN');
    final signupFinder = find.text('SIGNUP');

    // Elements on the Signup Page
    final text1Finder = find.text('Already HAVE AN ACCOUNT '.toUpperCase());
    final text2Finder = find.text(' NOW!'.toUpperCase());

    test('Login-Singup Screen check', () async {
      expect(await driver.getText(loginFinder), 'LOGIN');
      expect(await driver.getText(signupFinder), 'SIGNUP');
    });

    test('Check if Signup transistion is Successful', () async {
      await driver.tap(signupFinder);
      expect(await driver.getText(text1Finder),'Already HAVE AN ACCOUNT '.toUpperCase());
      expect(await driver.getText(loginFinder),'LOGIN'.toUpperCase());
      expect(await driver.getText(text2Finder),' NOW!'.toUpperCase());
    });
  });
}
