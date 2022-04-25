import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/domain/failures/failures.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_classic/presentation/widgets/app_widgets.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

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
                  title: AppStrings.passwordReset,
                  content: AppStrings.passwordResetLinkSent,
                  onPressed: () {
                    RouteService.goToPage(
                        route: const SignInRoute(),
                        duration: DurationConstant.d0);
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
                const SizedBox(height: AppSizes.s70),
                const Align(
                  alignment: Alignment.center,
                  child: Text(AppStrings.passwordResetEmail,
                      textAlign: TextAlign.center),
                ),
                const SizedBox(height: AppSizes.s70),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<SignInBloc>()
                        .add(const SignInEvent.resetPassword());
                  },
                  child: const Text(AppStrings.passwordReset),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
