import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/UserEntity.dart';
import '../../domain/failures/auth_failures.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryFirebaseImpl implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryFirebaseImpl({@required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, UserEntity>> getSignInUser() async {
    final currentUser = firebaseAuth.currentUser;

    if (currentUser == null) {
      return Left(AuthFailure(message: 'user not found'));
    }

    final userEntity = UserEntity(
      uuid: currentUser.uid,
      email: currentUser.email,
    );

    return Right(userEntity);
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(message: e.code));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure(message: e.code));
    }
  }

  @override
  Future<void> signOut() async {
    return await Future.wait([
      firebaseAuth.signOut(),
    ]);
  }
}
