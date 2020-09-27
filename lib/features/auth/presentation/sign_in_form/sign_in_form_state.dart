part of 'sign_in_form_cubit.dart';

abstract class SignInFormState extends Equatable {
  const SignInFormState();

  @override
  List<Object> get props => [];
}

class SignInFormInitial extends SignInFormState {
  const SignInFormInitial();
}

class SignInFormInvalidEmail extends SignInFormState {
  const SignInFormInvalidEmail();
}

class SignInFormInvalidPassword extends SignInFormState {
  const SignInFormInvalidPassword();
}

class SignInFormSuccess extends SignInFormState {
  const SignInFormSuccess();
}

class SignInFormError extends SignInFormState {
  final String message;

  const SignInFormError({@required this.message});
}
