import 'package:firebase_auth_classic/domain/failures/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

class NotAuthenticatedError extends Error {
  // final ValueFailure valueFailure;

  // NotAuthenticatedError(this.valueFailure);

  // @override
  // String toString() {
  //   const explanation =
  //       'Encountered a ValueFailure at an unrecoverable point. Terminating.';
  //   return Error.safeToString('$explanation Failure was: $valueFailure');
  // }
}
