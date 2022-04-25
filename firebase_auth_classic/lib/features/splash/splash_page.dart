import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth_classic/presentation/widgets/background_image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            RouteService.goToPage(
                route: const HomeRoute(), duration: DurationConstant.d3);
          },
          unauthenticated: (_) {
            RouteService.goToPage(
                route: const SignInRoute(), duration: DurationConstant.d3);
          },
        );
      },
      child: Scaffold(
        body: BackgroundImage(
          topPadding: AppSizes.s0,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  ImageAssets.logo,
                  width: AppSizes.s150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: AppSizes.s150, top: AppSizes.s20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LoadingAnimationWidget.flickr(
                      leftDotColor: AppColors.primary,
                      rightDotColor: AppColors.dimGray,
                      size: AppSizes.s40),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
