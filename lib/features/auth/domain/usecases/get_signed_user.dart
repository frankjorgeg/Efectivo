import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/UserEntity.dart';
import '../failures/auth_failures.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class GetSignedUserUseCase implements IUseCase<UserEntity, NoParams> {
  final IAuthRepository authRepository;

  const GetSignedUserUseCase({@required this.authRepository});

  @override
  Future<Either<AuthFailure, UserEntity>> call(NoParams params) async {
    return await authRepository.getSignedUser();
  }
}
