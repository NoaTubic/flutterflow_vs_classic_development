import 'package:firebase_auth_classic/presentation/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_classic/presentation/colors/app_colors.dart';

class LinearLoadingIndicator extends StatelessWidget {
  const LinearLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: null,
      minHeight: AppSizes.s2,
      color: AppColors.primary,
      backgroundColor: AppColors.dimGray.withOpacity(AppSizes.s0_5),
    );
  }
}
