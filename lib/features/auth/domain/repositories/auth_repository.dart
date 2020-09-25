import 'package:dartz/dartz.dart';

import '../entities/UserEntity.dart';
import '../failures/auth_failures.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, UserEntity>> getSignInUser();
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signOut();
}
