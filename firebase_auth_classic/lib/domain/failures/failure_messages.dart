part of 'failures.dart';

extension FailureMessages on Failure {
  String getFailureMessage() {
    return map(
      unexpectedError: (_) => 'Unexpected error',
    );
  }
}

extension AuthFailureMessages on AuthFailure {
  String getAuthFailureMessage() {
    return map(
      serverError: (_) => 'Server error',
      emailAlreadyInUse: (_) => 'Email already in use',
      invalidEmailAndPasswordCombination: (_) =>
          'Invalid email and password combination',
      userNotFound: (_) => 'There isn\'t an account linked with this email',
    );
  }
}

extension ValueFailureMessages on ValueFailure {
  String getValueFailureMessage() {
    return map(
        emptyEmailField: (_) => 'Please enter your email',
        emptyPasswordField: (_) => 'Please enter your password',
        emptyUsernameField: (_) => 'Please enter your username',
        invalidEmail: (_) => 'Invalid email format',
        shortPassword: (_) => 'Password must be at least 8 characters long',
        longUsername: (_) => 'Username can\'t be longer than 10 characters',
        exceedingLength: (_) => 'To do text too long',
        emptyToDo: (_) => 'Please enter a todo.');
  }
}

extension TodoFailureMessages on TodoFailure {
  String getTodoFailureMessages() {
    return map(unexpected: (_) => 'Unexpected error');
  }
}
