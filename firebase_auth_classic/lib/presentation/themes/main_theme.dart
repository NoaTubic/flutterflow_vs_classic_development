import 'package:firebase_auth_classic/presentation/styles/stlyes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_classic/presentation/resources.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.dimGray),
    cardTheme: const CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.dimGray,
      elevation: AppSizes.s4,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: AppSizes.s0,
    ),
    textTheme: TextTheme(
      headline1:
          getSemiBoldStyle(color: AppColors.dimGray, fontSize: FontSize.s16),
      subtitle1:
          getMediumStyle(color: AppColors.dimGray, fontSize: FontSize.s14),
      subtitle2:
          getMediumStyle(color: AppColors.dimGray, fontSize: FontSize.s14),
      caption:
          getRegularStyle(color: AppColors.dimGray, fontSize: FontSize.s16),
      bodyText1:
          getRegularStyle(color: AppColors.dimGray, fontSize: FontSize.s16),
      bodyText2:
          getRegularStyle(color: AppColors.dimGray, fontSize: FontSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      hintStyle:
          getRegularStyle(color: AppColors.dimGray, fontSize: FontSize.s16),
      errorStyle: getRegularStyle(color: AppColors.error),
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(
          vertical: AppSizes.s14, horizontal: AppSizes.s16),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.culture,
          width: AppSizes.s1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.s20),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSizes.s1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.s20),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppSizes.s1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.s20),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppSizes.s1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.s20),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s18),
        primary: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s20),
        ),
        elevation: AppSizes.s10,
        minimumSize: const Size(double.infinity, AppSizes.s50),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.dimGray,
        textStyle:
            getRegularStyle(color: AppColors.white, fontSize: FontSize.s16),
      ),
    ),
  );
}
