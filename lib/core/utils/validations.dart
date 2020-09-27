import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/domain/failures/auth_failures.dart';
import '../failures/failures.dart';

@LazySingleton()
class Validations {
  Either<Failure, String> validateEmailAddress(String input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(InvalidEmailFailure());
    }
  }

  Either<Failure, String> validatePassword(String input) {
    if (input.length >= 6) {
      return right(input);
    } else {
      return left(InvalidPasswordFailure());
    }
  }
}
