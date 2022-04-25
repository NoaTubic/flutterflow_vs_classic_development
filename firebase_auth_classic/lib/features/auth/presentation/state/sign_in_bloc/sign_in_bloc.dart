import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth_classic/features/auth/domain/value_objects.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInState get initialState => SignInState.initial();

  SignInBloc(this._authRepository) : super(SignInState.initial()) {
    on<EmailChanged>(
      (event, emit) async => emit(
        state.copyWith(
          emailAddress: EmailAddress(event.email),
          authFailureOrSuccessOption: none(),
        ),
      ),
    );
    on<PasswordChanged>(
      (event, emit) async => emit(
        state.copyWith(
          password: Password(event.password),
          authFailureOrSuccessOption: none(),
        ),
      ),
    );
    on<UsernameChanged>(
      (event, emit) async => emit(
        state.copyWith(
          username: Username(event.username),
          authFailureOrSuccessOption: none(),
        ),
      ),
    );
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;
      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();
      final isUsernameValid = state.username.isValid();

      if (isEmailValid && isPasswordValid && isUsernameValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));

        failureOrSuccess = await _authRepository.registerWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
          username: state.username,
        );
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    });

    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;
      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));

        failureOrSuccess = await _authRepository.signInWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
        );
      }

      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    });

    on<ResetPassword>(
      (event, emit) async {
        Either<AuthFailure, Unit>? failureOrSuccess;
        final isEmailValid = state.emailAddress.isValid();

        if (isEmailValid) {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          failureOrSuccess = await _authRepository.resetPassword(
            emailAddress: state.emailAddress,
          );
        }

        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
      },
    );
  }
}
