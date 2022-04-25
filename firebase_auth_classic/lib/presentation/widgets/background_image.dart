import 'package:firebase_auth_classic/presentation/resources.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
    required this.child,
    this.topPadding = AppSizes.s130,
  }) : super(key: key);

  final Widget child;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageAssets.gradientBackground),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
        ),
        child: child,
      ),
    );
  }
}
