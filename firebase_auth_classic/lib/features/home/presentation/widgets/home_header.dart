import 'package:firebase_auth_classic/presentation/styles/stlyes.dart';
import 'package:firebase_auth_classic/presentation/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_classic/features/auth/presentation/state/auth_bloc/auth_bloc.dart';
import 'package:firebase_auth_classic/presentation/resources.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.s20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoImage(
              size: AppSizes.s50,
            ),
            Text(
              AppStrings.homePageTitle,
              style: getMediumStyle(
                  color: AppColors.raisinBlack, fontSize: FontSize.s20),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(const AuthEvent.signedOut());
                    RouteService.goToPage(route: const SignInRoute());
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.culture,
                    size: AppSizes.s40,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
