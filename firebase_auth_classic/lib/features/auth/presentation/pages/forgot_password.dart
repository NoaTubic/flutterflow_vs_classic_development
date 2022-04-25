import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_classic/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:firebase_auth_classic/presentation/widgets/background_image.dart';
import 'package:firebase_auth_classic/injections/injection.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator<SignInBloc>(),
        child: BackgroundImage(
          topPadding: AppSizes.s0,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.s10,
                  top: AppSizes.s40,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        RouteService.goToPage(route: const SignInRoute());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                        size: AppSizes.s35,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.s130),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageAssets.logo,
                      width: AppSizes.s150,
                    ),
                    const SizedBox(height: AppSizes.s50),
                    const ResetPasswordForm(),
                    const SizedBox(height: AppSizes.s50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
