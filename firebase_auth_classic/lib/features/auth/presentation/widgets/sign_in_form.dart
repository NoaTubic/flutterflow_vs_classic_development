import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_classic/presentation/widgets/app_widgets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              showFlushbar(message: failure.getAuthFailureMessage())
                  .show(context);
            },
            (_) {
              RouteService.goToPage(route: const HomeRoute());
            },
          ),
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.s45),
          child: Form(
            autovalidateMode: context.read<SignInBloc>().state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                AuthTextFormField(
                  onChanged: (value) => context.read<SignInBloc>().add(
                        SignInEvent.emailChanged(value),
                      ),
                  validator: (_) =>
                      context.read<SignInBloc>().state.emailAddress.value.fold(
                            (failure) => failure.getValueFailureMessage(),
                            (_) => null,
                          ),
                ),
                const SizedBox(height: AppSizes.s20),
                AuthTextFormField(
                  hintText: 'Password',
                  isPassword: true,
                  onChanged: (value) => context.read<SignInBloc>().add(
                        SignInEvent.passwordChanged(value),
                      ),
                  validator: (_) =>
                      context.read<SignInBloc>().state.password.value.fold(
                            (failure) => failure.getValueFailureMessage(),
                            (_) => null,
                          ),
                ),
                const SizedBox(height: AppSizes.s20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      RouteService.goToPage(
                          route: const ResetPasswordRoute(),
                          duration: DurationConstant.d1);
                    },
                    child: const Text(AppStrings.forgotPassword),
                  ),
                ),
                const SizedBox(height: AppSizes.s30),
                if (state.isSubmitting) ...[
                  const LinearLoadingIndicator(),
                ],
                const SizedBox(height: AppSizes.s30),
                ElevatedButton(
                  onPressed: () {
                    context.read<SignInBloc>().add(
                        const SignInEvent.signInWithEmailAndPasswordPressed());
                  },
                  child: const Text(AppStrings.signIn),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
