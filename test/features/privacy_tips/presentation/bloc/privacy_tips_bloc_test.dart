import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/entities/tips.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/usecases/load_privacy_tips.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/presentation/bloc/privacy_tips_bloc.dart';

class MockLoadPrivacyTips extends Mock implements LoadPriavacyTips {}

void main() {
  MockLoadPrivacyTips mockLoadPrivacyTips;
  PrivacyTipsBloc privacyTipsBloc;

  setUp(() {
    mockLoadPrivacyTips = new MockLoadPrivacyTips();
    privacyTipsBloc =
        new PrivacyTipsBloc(loadPriavacyTips: mockLoadPrivacyTips);
  });

  final String id = '1';
  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user =
      new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
  final List<Tips> tips = new List<Tips>();

  test(
    'initialState()',
    () async {
      //act
      final result = privacyTipsBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the tips returned',
    () async {
      //arrange
      when(mockLoadPrivacyTips(any)).thenAnswer((_) async => Right(tips));
      //act
      privacyTipsBloc.dispatch(LoadPrivacyTipsEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, tips: tips),
      ];
      expectLater(privacyTipsBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the tips returned',
    () async {
      //arrange
      when(mockLoadPrivacyTips(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      privacyTipsBloc.dispatch(LoadPrivacyTipsEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user),
      ];
      expectLater(privacyTipsBloc.state, emitsInOrder(expected));
    },
  );
}
