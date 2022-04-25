import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
    this.size = AppSizes.s150,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.logo,
      width: size,
    );
  }
}
