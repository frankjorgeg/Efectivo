import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecase.dart';
import '../failures/auth_failures.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class RegisterWithEmailAndPasswordUsecase
    implements IUseCase<Unit, RegisterWithEmailAndPasswordUsecaseParams> {
  final IAuthRepository authRepository;

  const RegisterWithEmailAndPasswordUsecase({@required this.authRepository});

  @override
  Future<Either<AuthFailure, Unit>> call(
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
