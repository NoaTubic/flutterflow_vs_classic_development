import 'package:firebase_auth_classic/presentation/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_classic/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:firebase_auth_classic/presentation/widgets/background_image.dart';
import 'package:firebase_auth_classic/injections/injection.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator<SignInBloc>(),
        child: BackgroundImage(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LogoImage(),
              const SizedBox(height: AppSizes.s50),
              const SignUpForm(),
              const SizedBox(height: AppSizes.s50),
              TextButton(
                onPressed: () {
                  RouteService.goToPage(route: const SignInRoute());
                },
                child: const Text(AppStrings.alreadyHaveAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
