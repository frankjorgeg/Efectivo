import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Efectivo/core/usecases/usecase.dart';
import 'package:Efectivo/features/auth/domain/entities/UserEntity.dart';
import 'package:Efectivo/features/auth/domain/failures/auth_failures.dart';
import 'package:Efectivo/features/auth/domain/repositories/auth_repository.dart';
import 'package:Efectivo/features/auth/domain/usecases/get_signed_user.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  GetSignedUserUseCase usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetSignedUserUseCase(authRepository: mockAuthRepository);
  });

  final userEntity = UserEntity(uuid: '1', email: 'test@test.com');

  test(
    'should call the method [getSignInUser] from [AuthRepository] with success data',
    () async {
      when(mockAuthRepository.getSignedUser())
          .thenAnswer((_) async => Right(userEntity));

      final result = await usecase(const NoParams());

      expect(result, Right(userEntity));
      verify(mockAuthRepository.getSignedUser());
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );

  final failure = AuthFailure(message: 'something was wrong');

  test(
    'should call the method [getSignInUser] from [AuthRepository] with failure data',
    () async {
      when(mockAuthRepository.getSignedUser())
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(const NoParams());

      expect(result, Left(failure));
      verify(mockAuthRepository.getSignedUser());
      verifyNoMoreInteractions(mockAuthRepository);
    },
  );
}
