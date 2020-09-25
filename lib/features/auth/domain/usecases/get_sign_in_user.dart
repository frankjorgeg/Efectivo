import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/UserEntity.dart';
import '../repositories/auth_repository.dart';

class GetSignInUserUseCase implements IUseCase<UserEntity, NoParams> {
  final IAuthRepository authRepository;

  const GetSignInUserUseCase({@required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepository.getSignInUser();
  }
}
