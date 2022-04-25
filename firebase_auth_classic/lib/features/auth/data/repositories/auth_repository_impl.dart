import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth_classic/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth_classic/features/auth/domain/value_objects.dart';
import 'package:firebase_auth_classic/features/auth/data/models/user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required Username username,
  }) async {
    final emailAddressString = emailAddress.getOrCrash();
    final passwordString = password.getOrCrash();
    final usernameString = password.getOrCrash();
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      User user = result.user!;
      await user.updateDisplayName(usernameString);
      await signOut();
      return right(unit);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressString = emailAddress.getOrCrash();
    final passwordString = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressString,
        password: passwordString,
      );
      return right(unit);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'wrong-password' ||
          exception.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> resetPassword(
      {required EmailAddress emailAddress}) async {
    try {
      final emailAddressString = emailAddress.getOrCrash();
      await _firebaseAuth.sendPasswordResetEmail(email: emailAddressString);
      return right(unit);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        return left(const AuthFailure.userNotFound());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Option<UserEntity>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signOut() async => await _firebaseAuth.signOut();
}
