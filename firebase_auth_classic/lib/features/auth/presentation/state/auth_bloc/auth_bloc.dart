import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth_classic/features/auth/domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthState get initialState => const AuthState.initial();

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await _authRepository.getSignedInUser();
      userOption.fold(() => emit(const AuthState.unauthenticated()),
          (_) => emit(const AuthState.authenticated()));
      on<SignedOut>(
        (event, emit) async {
          await _authRepository.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
