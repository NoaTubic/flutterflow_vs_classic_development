import 'package:firebase_auth_classic/presentation/sizes/sizes.dart';
import 'package:firebase_auth_classic/presentation/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/sign_in_bloc/sign_in_bloc.dart';
import 'package:firebase_auth_classic/features/home/presentation/widgets/home_widgets.dart';
import 'package:firebase_auth_classic/injections/injection.dart';
import 'package:firebase_auth_classic/presentation/widgets/background_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SignInBloc>(),
      child: Scaffold(
        body: BackgroundImage(
          topPadding: AppSizes.s60,
          child: Stack(
            children: const [
              HomeHeader(),
              Align(
                alignment: Alignment.center,
                child: Text(AppStrings.homePageText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
