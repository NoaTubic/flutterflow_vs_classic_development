part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged(String email) = EmailChanged;
  const factory SignInEvent.passwordChanged(String password) = PasswordChanged;
  const factory SignInEvent.usernameChanged(String username) = UsernameChanged;
  const factory SignInEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SignInEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SignInEvent.resetPassword() = ResetPassword;
}
