// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/auth/data/repositories/auth_repository_impl.dart' as _i7;
import '../features/auth/domain/repositories/auth_repository.dart' as _i6;
import '../features/auth/presentation/state/auth_bloc/auth_bloc.dart' as _i9;
import '../features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart'
    as _i8;
import '../presentation/routes/auto_router.dart' as _i3;
import 'firebase_injectable_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i6.AuthRepository>(
      () => _i7.AuthRepositoryImpl(get<_i4.FirebaseAuth>()));
  gh.factory<_i8.SignInBloc>(() => _i8.SignInBloc(get<_i6.AuthRepository>()));
  gh.factory<_i9.AuthBloc>(() => _i9.AuthBloc(get<_i6.AuthRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends _i10.FirebaseInjectableModule {}
