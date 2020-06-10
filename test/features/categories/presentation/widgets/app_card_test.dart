import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/app_card.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {

  final int id = 1;
  final String name = "App 1";
  final String desc = "Desc 1";
  final String icon = "http://www.google.lk/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png";
  final String bg = "http://www.google.lk/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png";
  final String link = "www.link1.com";

  final App app = new App(id: id, name: name, desc: desc, icon: icon, bg: bg, link: link);

  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final String _id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user = new LoginUser(id: _id, email: _email, password: _password,imageUrl: _imageUrl,uid: _uid);;

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Material(
          child: widget,
        ),
      ),
    );
  }

//  Widget buildTestableWidget1() => MaterialApp(home: Image.network(app.getBG));
//  Widget buildTestableWidget2() => MaterialApp(home: Image(image: NetworkImage(app.getIcon)));

  testWidgets('Apps Card Widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AppCard(
      user: user,
      app: app,
    )));

//    mockNetworkImagesFor(() async => await tester.pumpWidget(buildTestableWidget1()));
//    mockNetworkImagesFor(() async => await tester.pumpWidget(buildTestableWidget2()));

    final nameFinder = find.text(app.getName.toUpperCase());
    final descFinder = find.text(app.getDesc);

    expect(descFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);

    await tester.pumpAndSettle();
  });
}
