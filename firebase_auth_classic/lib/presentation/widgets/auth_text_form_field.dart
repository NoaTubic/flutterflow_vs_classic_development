import 'package:firebase_auth_classic/presentation/sizes/sizes.dart';
import 'package:firebase_auth_classic/presentation/strings/strings.dart';
import 'package:firebase_auth_classic/presentation/styles/stlyes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_classic/presentation/colors/app_colors.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    Key? key,
    this.hintText = AppStrings.emailHint,
    this.onChanged,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  late bool _isVisible = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: AppSizes.s14,
            offset: Offset(AppSizes.s0, AppSizes.s8),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: _isVisible,
        style: getRegularStyle(color: AppColors.raisinBlack),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: Icon(
                    _isVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.dimGray,
                  ),
                )
              : null,
          hintText: widget.hintText,
          isDense: true,
        ),
      ),
    );
  }
}
