import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:Efectivo/core/utils/validations.dart';
import 'package:Efectivo/features/auth/domain/failures/auth_failures.dart';

void main() {
  Validations validation;

  setUp(() {
    validation = Validations();
  });

  group('email validations', () {
    final tEmail = 'test@test.com';
    final tErrorEmail = 'test';

    test(
      'should return a success data from [validateEmailAddress] method ',
      () async {
        final result = validation.validateEmailAddress(tEmail);
        expect(result, Right(tEmail));
      },
    );

    test(
      'should return a failure data from [validateEmailAddress] method ',
      () async {
        final result = validation.validateEmailAddress(tErrorEmail);
        expect(result, Left(InvalidEmailFailure()));
      },
    );
  });

  group('password validations', () {
    final tPassword = 'test123456789';
    final tErrorPassword = 'test1';

    test(
      'should return a success data from [validatePassword] method ',
      () async {
        final result = validation.validatePassword(tPassword);
        expect(result, Right(tPassword));
      },
    );

    test(
      'should return a failure data from [validatePassword] method ',
      () async {
        final result = validation.validatePassword(tErrorPassword);
        expect(result, Left(InvalidPasswordFailure()));
      },
    );
  });
}
