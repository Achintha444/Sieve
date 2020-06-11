import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/entities/laws.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/usecases/load_privacy_laws.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/presentation/bloc/privacy_laws_bloc.dart';

class MockLoadPrivacyLaws extends Mock implements LoadPrivacyLaws {}

void main() {
  MockLoadPrivacyLaws mockLoadPrivacyLaws;
  PrivacyLawsBloc privacyLawsBloc;

  setUp(() {
    mockLoadPrivacyLaws = new MockLoadPrivacyLaws();
    privacyLawsBloc =
        new PrivacyLawsBloc(loadPrivacyLaws: mockLoadPrivacyLaws);
  });

  final String id = '1';
  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user =
      new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
  final List<Laws> laws = new List<Laws>();

  test(
    'initialState()',
    () async {
      //act
      final result = privacyLawsBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the Laws returned',
    () async {
      //arrange
      when(mockLoadPrivacyLaws(any)).thenAnswer((_) async => Right(laws));
      //act
      privacyLawsBloc.dispatch(LoadPrivacyLawsEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, laws: laws),
      ];
      expectLater(privacyLawsBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the Laws do not returned',
    () async {
      //arrange
      when(mockLoadPrivacyLaws(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      privacyLawsBloc.dispatch(LoadPrivacyLawsEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user),
      ];
      expectLater(privacyLawsBloc.state, emitsInOrder(expected));
    },
  );
}
