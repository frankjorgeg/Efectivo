import 'package:Efectivo/core/failures/failures.dart';
import 'package:Efectivo/core/usecases/usecase.dart';
import 'package:Efectivo/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:meta/meta.dart';

@lazySingleton
class SignOutUseCase implements IUseCase<Unit, NoParams> {
  final IAuthRepository authRepository;

  SignOutUseCase({@required this.authRepository});

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    await authRepository.signOut();
    return Right(unit);
  }
}
