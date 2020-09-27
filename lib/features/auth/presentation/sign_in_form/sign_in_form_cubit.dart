import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/validations.dart';
import '../../domain/usecases/register_with_email_and_password.dart';
import '../../domain/usecases/sign_in_with_email_and_password.dart';

part 'sign_in_form_state.dart';

@injectable
class SignInFormCubit extends Cubit<SignInFormState> {
  final RegisterWithEmailAndPasswordUsecase
      _registerWithEmailAndPasswordUsecase;
  final SignInWithEmailAndPasswordUsecase _signInWithEmailAndPasswordUsecase;
  final Validations _validations;

  SignInFormCubit(
    this._registerWithEmailAndPasswordUsecase,
    this._signInWithEmailAndPasswordUsecase,
    this._validations,
  ) : super(SignInFormInitial());

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final emailValidation = _validations.validateEmailAddress(email);
    final passwordValidation = _validations.validatePassword(password);

    if (emailValidation.isLeft()) {
      return emit(const SignInFormInvalidEmail());
    } else if (passwordValidation.isLeft()) {
      return emit(SignInFormInvalidPassword());
    }

    final successOrFailure = await _registerWithEmailAndPasswordUsecase(
      RegisterWithEmailAndPasswordUsecaseParams(
        email: email,
        password: password,
      ),
    );

    successOrFailure.fold(
      (failure) => emit(SignInFormError(message: failure.message)),
      (unit) => emit(SignInFormSuccess()),
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final emailValidation = _validations.validateEmailAddress(email);
    final passwordValidation = _validations.validatePassword(password);

    if (emailValidation.isLeft()) {
      return emit(SignInFormInvalidEmail());
    } else if (passwordValidation.isLeft()) {
      return emit(SignInFormInvalidPassword());
    }

    final successOrFailure = await _signInWithEmailAndPasswordUsecase(
      SignInWithEmailAndPasswordUsecaseParams(email: email, password: password),
    );

    successOrFailure.fold(
      (failure) => emit(SignInFormError(message: failure.message)),
      (unit) => emit(SignInFormSuccess()),
    );
  }
}
