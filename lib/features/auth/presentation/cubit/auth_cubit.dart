import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/UserEntity.dart';
import '../../domain/usecases/get_signed_user.dart';
import '../../domain/usecases/sign_out.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final GetSignedUserUseCase _getSignedUserUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthCubit(
    this._getSignedUserUseCase,
    this._signOutUseCase,
  ) : super(AuthInitial());

  Future<void> authCheckRequested() async {
    final userOrFailure = await _getSignedUserUseCase(const NoParams());

    userOrFailure.fold(
      (failure) => emit(Unauthenticated()),
      (userEntity) => emit(Authenticated(userEntity: userEntity)),
    );
  }

  Future<void> signedOut() async {
    await _signOutUseCase(const NoParams());
    emit(Unauthenticated());
  }
}
