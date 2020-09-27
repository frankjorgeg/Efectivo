// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/data/repositories/auth_repository_firebase_impl.dart';
import 'core/injectable_modules/firebase_injectable_module.dart';
import 'features/auth/domain/usecases/get_signed_user.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/register_with_email_and_password.dart';
import 'features/auth/presentation/sign_in_form/sign_in_form_cubit.dart';
import 'features/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'features/auth/domain/usecases/sign_out.dart';
import 'core/utils/validations.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<IAuthRepository>(
      () => AuthRepositoryFirebaseImpl(get<FirebaseAuth>()));
  gh.lazySingleton<RegisterWithEmailAndPasswordUsecase>(() =>
      RegisterWithEmailAndPasswordUsecase(
          authRepository: get<IAuthRepository>()));
  gh.lazySingleton<SignInWithEmailAndPasswordUsecase>(() =>
      SignInWithEmailAndPasswordUsecase(
          authRepository: get<IAuthRepository>()));
  gh.lazySingleton<SignOutUseCase>(
      () => SignOutUseCase(authRepository: get<IAuthRepository>()));
  gh.lazySingleton<Validations>(() => Validations());
  gh.lazySingleton<GetSignedUserUseCase>(
      () => GetSignedUserUseCase(authRepository: get<IAuthRepository>()));
  gh.factory<SignInFormCubit>(() => SignInFormCubit(
        get<RegisterWithEmailAndPasswordUsecase>(),
        get<SignInWithEmailAndPasswordUsecase>(),
        get<Validations>(),
      ));
  gh.factory<AuthCubit>(
      () => AuthCubit(get<GetSignedUserUseCase>(), get<SignOutUseCase>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
