import 'package:dartz/dartz.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';

Either<ValueFailure, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else if (input.isEmpty) {
    return left(const ValueFailure.emptyEmailField());
  } else {
    return left(const ValueFailure.invalidEmail());
  }
}

Either<ValueFailure, String> validatePassword(String input) {
  if (input.length >= 8) {
    return right(input);
  } else if (input.isEmpty) {
    return left(const ValueFailure.emptyPasswordField());
  } else {
    return left(const ValueFailure.shortPassword());
  }
}

Either<ValueFailure, String> validateUsername(String input) {
  if (input.length < 10 && input.length > 1) {
    return right(input);
  } else if (input.isEmpty) {
    return left(const ValueFailure.emptyUsernameField());
  } else {
    return left(const ValueFailure.longUsername());
  }
}

Either<ValueFailure, String> validateToDo(String input) {
  if (input.length < 30 && input.length > 1) {
    return right(input);
  } else if (input.isEmpty) {
    return left(const ValueFailure.emptyToDo());
  } else {
    return left(const ValueFailure.exceedingLength());
  }
}
