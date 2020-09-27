import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Efectivo/features/auth/domain/repositories/auth_repository.dart';
import 'package:Efectivo/features/auth/domain/failures/auth_failures.dart';
import 'package:Efectivo/features/auth/domain/usecases/register_with_email_and_password.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  RegisterWithEmailAndPasswordUsecase usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = RegisterWithEmailAndPasswordUsecase(
      authRepository: mockAuthRepository,
    );
  });

  final tEmail = 'test@test.com';
  final tPassword = 'Test123456789';

  test(
    'should call the method [registerWithEmailAndPassword] from the [AuthRepository] with success data',
    () async {
      when(mockAuthRepository.registerWithEmailAndPassword(tEmail, tPassword))
          .thenAnswer((_) async => Right(unit));

      final result = await usecase(RegisterWithEmailAndPasswordUsecaseParams(
        email: tEmail,
        password: tPassword,
      ));

      expect(result, Right(unit));
      verify(
        mockAuthRepository.registerWithEmailAndPassword(tEmail, tPassword),
      );
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  final failure = AuthFailure(message: 'something was wrong');

  test(
    'should call the method [registerWithEmailAndPassword] from the [AuthRepository] with failure data',
    () async {
      when(mockAuthRepository.registerWithEmailAndPassword(tEmail, tPassword))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(RegisterWithEmailAndPasswordUsecaseParams(
        email: tEmail,
        password: tPassword,
      ));

      expect(result, Left(failure));
      verify(
        mockAuthRepository.registerWithEmailAndPassword(tEmail, tPassword),
      );
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
