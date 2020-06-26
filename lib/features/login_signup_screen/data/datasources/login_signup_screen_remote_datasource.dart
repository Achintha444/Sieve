import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../../../login_screen/data/models/login_user_model.dart';

abstract class LoginSignupScreenRemoteDataSource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginUserModel> getGoogleLogin();

  /// Logout Google
  Future<void> googleLogout();

  /// Throws a [ServerException] for all error codes.
  Future<LoginUserModel> getFacebookLogin();

  /// Logout Google
  Future<void> facebookLogout();
}

class LoginSignupScreenRemoteDataSourceImpl
    implements LoginSignupScreenRemoteDataSource {
  final http.Client httpClient;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email',
    ],
  );

  FacebookLogin facebookLogin = FacebookLogin();

  LoginSignupScreenRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<LoginUserModel> getGoogleLogin() async {
    return await this._googleSignIn.signIn().then((user) async {
      print(user);
      try {
        final response = await httpClient.post(API_URL + "/user/signupGF",
            body: {
              'email': user.email,
              'uid': user.id,
              'imageUrl': user.photoUrl
            });
        print(response);
        if (response.statusCode != 200) {
          final error = json.decode(response.body);
          if (error['serverError'] == true) {
            throw ServerException();
          } else if (error['blockedError'] == true) {
            throw UserBlockedException();
          } else {
            throw InvalidInputException();
          }
        } else {
          print(response);
          return LoginUserModel.fromJsonGF(json.decode(response.body));
        }
      } catch (e) {
        if (e.runtimeType == InvalidInputException) {
          throw InvalidInputException();
        } else if (e.runtimeType == UserBlockedException) {
          throw UserBlockedException();
        }
        throw ServerException();
      }
    }).catchError((Object error) async {
      print('HIiiiiiii');
      if (error.runtimeType == UserBlockedException) {
        await this.googleLogout();
        throw UserBlockedException();
      }
      throw ServerException();
    });
  }

  Future<void> googleLogout() async {
    await _googleSignIn.signOut().catchError((Object error) {
      throw ServerException();
    });
  }

  @override
  Future<void> facebookLogout() {
    return facebookLogin.logOut().catchError((Object error) {
      throw ServerException();
    });
  }

  @override
  Future<LoginUserModel> getFacebookLogin() async {
    final _result = await facebookLogin.logIn(['email']);
    switch (_result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = _result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final user = jsonDecode(graphResponse.body);
        print(user);
        try {
          final response =
              await httpClient.post(API_URL + "/user/signupGF", body: {
            'email': user['email'],
            'uid': user['id'],
            'imageUrl': user["picture"]["data"]["url"]
          });
          print(response.body);
          if (response.statusCode != 200) {
            final error = json.decode(response.body);
            if (error['serverError'] == true) {
              throw ServerException();
            } else if (error['blockedError'] == true) {
              throw UserBlockedException();
            } else {
              throw InvalidInputException();
            }
          } else {
            print(response);
            return LoginUserModel.fromJsonGF(json.decode(response.body));
          }
        } catch (e) {
          print(e);
          if (e.runtimeType == InvalidInputException) {
            throw InvalidInputException();
          } else if (e.runtimeType == UserBlockedException) {
            throw UserBlockedException();
          }
          throw ServerException();
        }

        break;

      case FacebookLoginStatus.cancelledByUser:
        throw ServerException();
        break;
      case FacebookLoginStatus.error:
        throw ServerException();
        break;
    }
  }
}
