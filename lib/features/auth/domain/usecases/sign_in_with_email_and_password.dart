import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SignInWithEmailAndPasswordUsecase
    implements IUseCase<Unit, SignInWithEmailAndPasswordUsecaseParams> {
  final IAuthRepository authRepository;

  SignInWithEmailAndPasswordUsecase({@required this.authRepository});

  @override
  Future<Either<Failure, Unit>> call(
    SignInWithEmailAndPasswordUsecaseParams params,
  ) async {
    return await authRepository.signInWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class SignInWithEmailAndPasswordUsecaseParams extends Equatable {
  final String email;
  final String password;

  const SignInWithEmailAndPasswordUsecaseParams({
    @required this.email,
    @required this.password,
  });

  @override
  @override
  List<Object> get props => [email, password];
}
