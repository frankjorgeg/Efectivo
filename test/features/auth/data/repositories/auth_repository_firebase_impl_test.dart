import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:Efectivo/features/auth/data/repositories/auth_repository_firebase_impl.dart';
import 'package:Efectivo/features/auth/domain/failures/auth_failures.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  AuthRepositoryFirebaseImpl repository;
  MockUserCredential userCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    repository = AuthRepositoryFirebaseImpl(mockFirebaseAuth);
    userCredential = MockUserCredential();
  });

  test(
    'should return a failure when the method [currentUser] return null',
    () async {
      when(mockFirebaseAuth.currentUser).thenReturn(null);

      final result = await repository.getSignedUser();

      expect(result, Left(AuthFailure(message: 'user not found')));
    },
  );

  test(
    'should call [signOut] method from firebase',
    () async {
      when(mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());

      await repository.signOut();

      verify(mockFirebaseAuth.signOut());
    },
  );

  group('create a user', () {
    final tEmail = 'test@test.com';
    final tPassword = 'Test123456789';

    test(
      'should return a unit when the the user was created',
      () async {
        when(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        )).thenAnswer((_) async => userCredential);

        final result = await repository.registerWithEmailAndPassword(
          tEmail,
          tPassword,
        );

        expect(result, Right(unit));
      },
    );

    test(
      'should return a failure when the the user was not created',
      () async {
        when(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        )).thenThrow(FirebaseAuthException(message: 'someting was wrong'));

        final result = await repository.registerWithEmailAndPassword(
          tEmail,
          tPassword,
        );

        expect(result, Left(AuthFailure(message: 'someting was wrong')));
      },
    );
  });

  group('sign in user', () {
    final tEmail = 'test@test.com';
    final tPassword = 'Test123456789';

    test(
      'should return a unit when the the user was sign in',
      () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        )).thenAnswer((_) async => userCredential);

        final result = await repository.signInWithEmailAndPassword(
          tEmail,
          tPassword,
        );

        expect(result, Right(unit));
      },
    );

    test(
      'should return a failure when the the user cant sign in',
      () async {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
          email: tEmail,
          password: tPassword,
        )).thenThrow(FirebaseAuthException(message: 'someting was wrong'));

        final result = await repository.signInWithEmailAndPassword(
          tEmail,
          tPassword,
        );

        expect(result, Left(AuthFailure(message: 'someting was wrong')));
      },
    );
  });
}
