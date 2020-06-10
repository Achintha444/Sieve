import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//! Signup Screen to Login Out Integration Testing

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

  group('Signup screen to Logging Out', () {
    // Elements on the Login-Signup Page
    final login1Finder = find.text('LOGIN');
    final signup1Finder = find.text('SIGNUP');
    final loginWithTextFinder = find.text('Login With'.toUpperCase());

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
    //final categoryBottomNavItem = find.byValueKey('Category');
    final dashboardBottomNavItem = find.byValueKey('Dashboard');
    final newsFeedBottomNavItem = find.byValueKey('News Feed');
    //final tipBottomNavItem = find.byValueKey('Privacy Tips');
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
    final catTextFinder3 = find.text('Apps on the Category');

    // Elements on the search page
    final searchTextFinder = find.text('SEARCH APP');

    // Elements on the Dashboard Page
    final dashboardTextFinder = find.text('Data Privacy Intruseivess');

    // Elements on the NewsFeed Page
    final newsFeedTextFinder = find.text('Interesting News About Data Privacy');

    // Elements on the Privacy Laws Page
    final privacyLawsTextFinder = find.text('Privacy Laws Implemented across the Globe');

    test('Signup a user to Logout a user Functions', () async {
      
      //* Signup Page

      await driver.clearTimeline();
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(emailFinder);
      await driver.tap(find.byValueKey('email_field'));
      await driver.enterText(
          'intTest@gmail.com'); // change this email , if the test is not working
      await driver.waitFor(find.text('intTest@gmail.com'));
      await driver.tap(passwordFinder);
      await driver.enterText('Temp@133');
      //await driver.waitFor(find.text('intTest@gmail.com'));
      await driver.tap(reEnterPassword);
      await driver.enterText('Temp@133');
      await Future.delayed(Duration(seconds: 3));
      //await driver.waitFor(find.text('intTest@gmail.com'));
      await driver.tap(signupFinder);

      //* Login Page
     
      await driver.waitFor(signupFinder1);
       print('Now we should be in Login Page');
      expect(await driver.getText(signupFinder1), 'SIGN UP');
      expect(await driver.getText(text3Finder),
          'DO NOT HAVE AN ACCOUNT '.toUpperCase());
      expect(await driver.getText(text4Finder), ' NOW!'.toUpperCase());

      await driver.tap(emailFinder);
      await driver.enterText('intTest@gmail.com');
      await driver.tap(passwordFinder);
      await driver.enterText('Temp@133');
      await driver.tap(loginFinder);
      
      //* Category Page

      print('Now we should be in the category page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(catText1Finder), 'Select a Category');
      expect(await driver.getText(catTextFinder3), 'Apps on the Category');
      
      await driver.tap(refreshFinder);
      print('Again we should be on the category page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(catText1Finder), 'Select a Category');
      expect(await driver.getText(catTextFinder3), 'Apps on the Category');

      await driver.tap(drawerFinder);
      print('Drawer Should open');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(suggestionFinder), 'SUGGESTIONS');
      expect(await driver.getText(licensesFinder), 'LICENSES');
      expect(await driver.getText(logoutFinder), 'LOGOUT');
      await driver.tap(closeButtonFinder);
      print('Now we should be back on the category page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(catText1Finder), 'Select a Category');
      expect(await driver.getText(catTextFinder3), 'Apps on the Category');

      await driver.tap(searchFinder);
      print('Now we should be on the search page');
      await Future.delayed(Duration(seconds: 4));
      expect(await driver.getText(searchTextFinder), 'SEARCH APP');
      await driver.tap(find.pageBack());
      print('Now we should be on the category page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(catText1Finder), 'Select a Category');
      expect(await driver.getText(catTextFinder3), 'Apps on the Category');

      //* Dashboard Page

      await driver.tap(dashboardBottomNavItem);
      print ('Now we should be on the Dashboard Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(dashboardTextFinder), 'Data Privacy Intruseivess');

      await driver.tap(refreshFinder);
      print ('Again we should be on the Dashboard Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(dashboardTextFinder), 'Data Privacy Intruseivess');
      
      await driver.tap(drawerFinder);
      print('Drawer Should open');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(suggestionFinder), 'SUGGESTIONS');
      expect(await driver.getText(licensesFinder), 'LICENSES');
      expect(await driver.getText(logoutFinder), 'LOGOUT');
      await driver.tap(closeButtonFinder);
      print('Now we should be back on the dashboard page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(dashboardTextFinder), 'Data Privacy Intruseivess');

      await driver.tap(searchFinder);
      print('Now we should be on the search page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(searchTextFinder), 'SEARCH APP');
      await driver.tap(find.pageBack());
      print('Now we should be on the dashboard page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(dashboardTextFinder), 'Data Privacy Intruseivess');

      //* News Feed Page

      await driver.tap(newsFeedBottomNavItem);
      print('Now we should be on the news feed page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(newsFeedTextFinder), 'Interesting News About Data Privacy');

      await driver.tap(refreshFinder);
      print ('Again we should be on the News Feed Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(newsFeedTextFinder), 'Interesting News About Data Privacy');
      
      await driver.tap(drawerFinder);
      print('Drawer Should open');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(suggestionFinder), 'SUGGESTIONS');
      expect(await driver.getText(licensesFinder), 'LICENSES');
      expect(await driver.getText(logoutFinder), 'LOGOUT');
      await driver.tap(closeButtonFinder);
      print ('Again we should be on the News Feed Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(newsFeedTextFinder), 'Interesting News About Data Privacy');

      //* Privacy Laws Page

      await driver.tap(lawBottomNavItem);
      print('Now we should be on the Privacy Laws Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(privacyLawsTextFinder), 'Privacy Laws Implemented across the Globe');

      await driver.tap(refreshFinder);
      print('Again we should be on the Privacy Laws Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(privacyLawsTextFinder), 'Privacy Laws Implemented across the Globe');
      
      await driver.tap(drawerFinder);
      print('Drawer Should open');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(suggestionFinder), 'SUGGESTIONS');
      expect(await driver.getText(licensesFinder), 'LICENSES');
      expect(await driver.getText(logoutFinder), 'LOGOUT');
      await driver.tap(closeButtonFinder);
      print('Again we should be on the Privacy Laws Page');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(privacyLawsTextFinder), 'Privacy Laws Implemented across the Globe');

      //* Logging Out

      await driver.tap(drawerFinder);
      print('Drawer Should open');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(suggestionFinder), 'SUGGESTIONS');
      expect(await driver.getText(licensesFinder), 'LICENSES');
      expect(await driver.getText(logoutFinder), 'LOGOUT');

      await driver.tap(logoutFinder);
      print('Now we should be logged out of the system');
      await Future.delayed(Duration(seconds: 3));
      expect(await driver.getText(login1Finder), 'LOGIN');
      expect(await driver.getText(signup1Finder), 'SIGNUP');
      expect(await driver.getText(loginWithTextFinder),'Login With'.toUpperCase());
      
    },timeout:Timeout(Duration(seconds:999999)));
  });
}
