import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Efectivo/features/auth/domain/failures/auth_failures.dart';
import 'package:Efectivo/features/auth/domain/repositories/auth_repository.dart';
import 'package:Efectivo/features/auth/domain/usecases/sign_in_with_email_and_password.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  SignInWithEmailAndPasswordUsecase usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase =
        SignInWithEmailAndPasswordUsecase(authRepository: mockAuthRepository);
  });

  final tEmail = 'test@test.com';
  final tPassword = 'Test123456789';

  test(
    'should call the method [signInWithEmailAndPassword] from the [AuthRepository] with success data',
    () async {
      when(mockAuthRepository.signInWithEmailAndPassword(tEmail, tPassword))
          .thenAnswer((_) async => Right(unit));

      final result = await usecase(SignInWithEmailAndPasswordUsecaseParams(
        email: tEmail,
        password: tPassword,
      ));

      expect(result, Right(unit));
      verify(mockAuthRepository.signInWithEmailAndPassword(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  final failure = AuthFailure(message: 'something was wrong');

  test(
    'should call the method [signInWithEmailAndPassword] from the [AuthRepository] with failure data',
    () async {
      when(mockAuthRepository.signInWithEmailAndPassword(tEmail, tPassword))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(SignInWithEmailAndPasswordUsecaseParams(
        email: tEmail,
        password: tPassword,
      ));

      expect(result, Left(failure));
      verify(mockAuthRepository.signInWithEmailAndPassword(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
