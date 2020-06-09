import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//! Signup Screen Function

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
  //* Signup screen Functions
  group('Signup screen Functions Test', () {
    // Elements on the Signup Page
    final signupFinder = find.byValueKey('Signup_button');
    final emailFinder = find.byValueKey('email_field');
    final passwordFinder = find.byValueKey('password_field');
    final reEnterPassword = find.byValueKey('re_enter_password_field');

    // Elements on the Login Page
    final signupFinder1 = find.text('SIGN UP');
    final text3Finder = find.text('DO NOT HAVE AN ACCOUNT '.toUpperCase());
    final text4Finder = find.text(' NOW!'.toUpperCase());
    final loginFinder = find.byValueKey('login_button');

    // Elements on the BottomNavBar
    final categoryBottomNavItem = find.byValueKey('Category');
    final dashboardBottomNavItem = find.byValueKey('Dashboard');
    final newsFeedBottomNavItem = find.byValueKey('News Feed');
    final tipBottomNavItem = find.byValueKey('Privacy Tips');
    final lawBottomNavItem = find.byValueKey('Privacy Laws');

    // FloatingButtons
    final searchFinder = find.byValueKey('search');
    final refreshFinder = find.byValueKey('refresh');

    // Drawer
    final drawerFinder = find.byTooltip('Open navigation menu');
    final suggestionFinder = find.text('SUGGESTIONS');
    final licensesFinder = find.text('LICENSES');
    final logoutFinder = find.text('LOGOUT');
    final closeButtonFinder = find.byType('IconButton');

    // Elements on the Category Page
    final catText1Finder = find.text('Select a Category');
    final catTextFinder2 = find.text('Apps on the Category');

    // Elements on the Dashboard Page
    final dashboardTextFinder = find.text('Data Privacy Intruseivess');

    // Elements on the NewsFeed Page
    final newsFeedTextFinder = find.text('Interesting News About Data Privacy');

    // Elements on the Privacy Laws Page
    final privacyLawsTextFinder = find.text('Privacy Laws Implemented across the Globe');




    test('Signup a user to Logout a user Functions', () async {
      await driver.clearTimeline();
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(emailFinder);
      await driver.tap(find.byValueKey('email_field'));
      await driver.enterText(
          'intTest@gmail.com'); // change this email , if the test is not working
      await driver.waitFor(find.text('intTest@gmail.com'));
      await driver.tap(passwordFinder);
      await driver.enterText('Temp@123');
      //await driver.waitFor(find.text('intTest@gmail.com'));
      await driver.tap(reEnterPassword);
      await driver.enterText('Temp@123');
      await Future.delayed(Duration(seconds: 2));
      //await driver.waitFor(find.text('intTest@gmail.com'));
      await driver.tap(signupFinder);

      //* Now we should be in Login Page
      await driver.waitFor(signupFinder1);
      expect(await driver.getText(signupFinder1), 'SIGN UP');
      expect(await driver.getText(text3Finder),
          'DO NOT HAVE AN ACCOUNT '.toUpperCase());
      expect(await driver.getText(text4Finder), ' NOW!'.toUpperCase());

      await driver.tap(emailFinder);
      await driver.enterText('intTest@gmail.com');
      await driver.tap(passwordFinder);
      await driver.enterText('Temp@123');
      await driver.tap(loginFinder);
      
      //* Now we should be in the category page
      expect(await driver.getText(find.text('SELECT A CATEGORY')), 'SELECT A CATEGORY');
      await driver.tap(find.byType('Icons.category'));
      expect(await driver.getText(find.text('SELECT A CATEGORY')), 'SELECT A CATEGORY');
    });
  });
}
