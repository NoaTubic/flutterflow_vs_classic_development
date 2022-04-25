import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_classic/presentation/widgets/app_widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

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
              showOkDialog(
                  context: context,
                  title: AppStrings.accountCreated,
                  content: AppStrings.accountCreatedMessage,
                  onPressed: () {
                    RouteService.goToPage(route: const SignInRoute());
                    Navigator.pop(context);
                  });
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
                  hintText: AppStrings.username,
                  onChanged: (value) => context.read<SignInBloc>().add(
                        SignInEvent.usernameChanged(value),
                      ),
                  validator: (_) =>
                      context.read<SignInBloc>().state.username.value.fold(
                            (failure) => failure.getValueFailureMessage(),
                            (_) => null,
                          ),
                ),
                const SizedBox(
                  height: AppSizes.s20,
                ),
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
                const SizedBox(
                  height: AppSizes.s20,
                ),
                AuthTextFormField(
                  hintText: AppStrings.password,
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
                const SizedBox(height: AppSizes.s28_5),
                if (state.isSubmitting) ...[
                  const LinearLoadingIndicator(),
                ],
                const SizedBox(height: AppSizes.s28_5),
                ElevatedButton(
                  onPressed: () {
                    context.read<SignInBloc>().add(const SignInEvent
                        .registerWithEmailAndPasswordPressed());
                  },
                  child: const Text(AppStrings.signUp),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
