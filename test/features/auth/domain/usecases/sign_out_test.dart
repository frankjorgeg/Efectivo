import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Efectivo/core/usecases/usecase.dart';
import 'package:Efectivo/features/auth/domain/repositories/auth_repository.dart';
import 'package:Efectivo/features/auth/domain/usecases/sign_out.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  SignOutUseCase usecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SignOutUseCase(authRepository: mockAuthRepository);
  });

  test('should call [signOut] method from repository', () async {
    when(mockAuthRepository.signOut()).thenAnswer((_) => Future.value());

    final result = await usecase(const NoParams());

    expect(result, Right(unit));
    verify(mockAuthRepository.signOut());
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
