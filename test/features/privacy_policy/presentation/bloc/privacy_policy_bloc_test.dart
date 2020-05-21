import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/usecases/get_privacy_policy.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/bloc/privacy_policy_bloc.dart';

class MockGetPrivacyPolcy extends Mock implements GetPriacyPolicy {}

void main() {
  MockGetPrivacyPolcy mockGetPrivacyPolcy;
  PrivacyPolicyBloc privacyPolicyBloc;

  setUp(() {
    mockGetPrivacyPolcy = new MockGetPrivacyPolcy();
    privacyPolicyBloc =
        new PrivacyPolicyBloc(getPriacyPolicy: mockGetPrivacyPolcy);
  });

  test(
    'initialState()',
    () async {
      //act
      final result = privacyPolicyBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  group('GetPrivacyPolicy', () {
    final tPrivacyPolicy = PrivacyPolicy(
        types: [
          "name",
          "email",
          "gender"
        ],
        usages: [
          "Location related information to provide,personalise and improve their product,including ads,for you and the others",
          "Network and connection information(people,pages,account,hashtags etc) may use to help others and you to find people you may know"
        ],
        removal: [
          "Data store until your account is deleted.",
          "But when  the account is deleted all posted information given by others about you is not deleted since it a part of your account.So they are not deleted "
        ],
        contactLink: "https://www.facebook.com/help/contact/861937627253138",
        email: "achinthaisuru444@gmail.com",
        fiLine: "Facebook,inc.ATTN:",
        sLine: "Privacy operation 1601",
        tLine: "Willow Road Menlo Park",
        foLine: "CA 94028,USA");
    final String id = '1';
    final String email = 'test@gmail.com';
    final String password = 'Test@123';
    final String _imageUrl = 'www.google.com';
    final String _uid = '123';
    final LoginUser loginUser = new LoginUser(
        id: id,
        email: email,
        password: password,
        imageUrl: _imageUrl,
        uid: _uid);
    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetPrivacyPolcy(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        privacyPolicyBloc
            .dispatch(LoadPrivacyPolicyEvent(appId: '1', user: loginUser));
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(user: loginUser),
        ];
        expectLater(privacyPolicyBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetPrivacyPolcy(any))
            .thenAnswer((_) async => Right(tPrivacyPolicy));
        //act
        privacyPolicyBloc
            .dispatch(LoadPrivacyPolicyEvent(appId: '1', user: loginUser));
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(privacyPolicy: tPrivacyPolicy, user: loginUser),
        ];
        expectLater(privacyPolicyBloc.state, emitsInOrder(expected));
      },
    );
  });
}
