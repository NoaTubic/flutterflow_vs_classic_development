import 'package:dartz/dartz.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth_classic/features/auth/domain/value_objects.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required Username username,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> resetPassword({
    required EmailAddress emailAddress,
  });

  Future<Option<UserEntity>> getSignedInUser();

  Future<void> signOut();
}
