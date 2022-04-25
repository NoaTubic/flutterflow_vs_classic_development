import 'package:dartz/dartz.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/domain/value_objects.dart';
import 'package:firebase_auth_classic/domain/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);
}
