import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';
part 'failure_messages.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.unexpectedError() = _UnexpectedError;
}

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.userNotFound() = _UserNotFound;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      _InvalidEmailAndPasswordCombination;
}

@freezed
abstract class ValueFailure with _$ValueFailure {
  const factory ValueFailure.emptyEmailField() = _EmptyEmailField;
  const factory ValueFailure.emptyPasswordField() = _EmptyPasswordField;
  const factory ValueFailure.emptyUsernameField() = _EmptyUsernameField;
  const factory ValueFailure.invalidEmail() = _InvalidEmail;
  const factory ValueFailure.shortPassword() = _ShortPassword;
  const factory ValueFailure.longUsername() = _LongUsername;
  const factory ValueFailure.exceedingLength() = _ExceedingLength;
  const factory ValueFailure.emptyToDo() = _EmptyToDo;
}

@freezed
abstract class TodoFailure with _$TodoFailure {
  const factory TodoFailure.unexpected() = _Unexpected;
}
