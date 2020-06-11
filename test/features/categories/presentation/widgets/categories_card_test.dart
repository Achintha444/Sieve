import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/categories_card.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

void main() {

  final int id = 1;
  final String name = "Category 1";
  final String icon = "e2bc";

  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final String _id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user = new LoginUser(id: _id, email: _email, password: _password,imageUrl: _imageUrl,uid: _uid);

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

  testWidgets('Categories Card Widget', (WidgetTester tester) async {

    await tester.pumpWidget(buildTestableWidget(CategoriesCard(
      user:user,
      id: id,
      name: name,
      icon: icon,
    )));

    final cardFinder = find.byKey(Key('categoryCard'));
    final nameFinder = find.text(name.toUpperCase());
    final iconFinder = find.byIcon(IconData(int.parse('0x' + icon), fontFamily: 'MaterialIcons'));

    expect(cardFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);

    await tester.pumpAndSettle();
  });
}
