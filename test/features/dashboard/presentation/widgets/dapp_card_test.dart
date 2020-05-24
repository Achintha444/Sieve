import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/dashboard/presentation/widgets/dapp_card.dart';

void main() {
  final String aName = 'test app1';
  final String cName = 'test category1';
  final String iconImage = 'https://img.icons8.com/ios-filled/50/000000/uber.png';
  final int dCount=14;

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
  testWidgets('Dapp Card Widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(DappCard(
      aName: aName,
      cName: cName,
      iconImage: iconImage,
      dCount:dCount ,
    )));

    final String check=dCount.toString();

    final aNameFinder = find.text(aName);
    final cNameFinder = find.text(cName);
    //final iconImageFinder = find.text(iconImage);
    //final dCountFinder = find.text(check);

    expect(aNameFinder, findsOneWidget);
    expect(cNameFinder, findsOneWidget);
    //expect(iconImageFinder, findsOneWidget);
    //expect(dCountFinder,check);

  });
}
    
