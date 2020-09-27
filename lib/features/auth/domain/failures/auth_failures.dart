import 'package:meta/meta.dart';

import '../../../../core/failures/failures.dart';

@immutable
class AuthFailure extends Failure {
  final String message;

  const AuthFailure({@required this.message});

  @override
  List<Object> get props => [];
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure();

  @override
  List<Object> get props => [];
}

class InvalidPasswordFailure extends Failure {
  const InvalidPasswordFailure();

  @override
  List<Object> get props => [];
}
