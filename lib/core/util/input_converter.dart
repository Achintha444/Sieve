import 'package:dartz/dartz.dart';
import '../Error/Faliure.dart';

class InputConverter {
  Either<Faliure, String> check(String str) {
    try {
      if (str.isEmpty) throw FormatException();
      final alphanumeric = RegExp('[a-zA-Z]');
      final response = alphanumeric.hasMatch(str);
      if (!response) throw FormatException();
      return Right(str);
    } on FormatException {
      return Left(InvalidInputFaliure());
    }
  }

  //* For Front End Validation - Email (Presentation Logic)

  bool checkEmail(String email) {
    //* checks emails in 'anything@string.com' and 'anything@string.co.in' domains
    String _pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    return (RegExp(_pattern).hasMatch(email));
  }

  //* For Front End Validation - Email (Presentation Logic)

  bool checkPassword(String password) {
    //* can check password 1 - Uppercase, 1- Lowercase, 1 - number , 1- Specialase
    String _pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return (RegExp(_pattern).hasMatch(password));
    //return true;
  }

  bool checkPasswordSimilar(String passwordOne, String passwordTwo){
    return (passwordOne==passwordTwo);
  }
}
