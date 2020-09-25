import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class RegisterWithEmailAndPasswordUsecase
    implements IUseCase<Unit, RegisterWithEmailAndPasswordUsecaseParams> {
  final IAuthRepository authRepository;

  const RegisterWithEmailAndPasswordUsecase({@required this.authRepository});

  @override
  Future<Either<Failure, Unit>> call(
    RegisterWithEmailAndPasswordUsecaseParams params,
  ) async {
    return await authRepository.registerWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class RegisterWithEmailAndPasswordUsecaseParams extends Equatable {
  final String email;
  final String password;

  const RegisterWithEmailAndPasswordUsecaseParams({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
