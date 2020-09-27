part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final UserEntity userEntity;

  Authenticated({@required this.userEntity});
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}
