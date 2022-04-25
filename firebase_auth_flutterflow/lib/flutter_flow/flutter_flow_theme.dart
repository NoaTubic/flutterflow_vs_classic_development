// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color grayDark;
  Color dark900;
  Color background;
  Color grayIcon;
  Color tertiary;

  TextStyle get title1 => GoogleFonts.getFont(
        'Rubik',
        color: tertiaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Rubik',
        color: tertiaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Rubik',
        color: tertiary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Rubik',
        color: dark900,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Rubik',
        color: tertiaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Rubik',
        color: grayIcon,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Rubik',
        color: grayIcon,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF009FB7);
  Color secondaryColor = const Color(0xFF696773);
  Color tertiaryColor = const Color(0xFFFFFFFF);
  Color alternate = const Color(0x00000000);
  Color primaryBackground = const Color(0x00000000);
  Color secondaryBackground = const Color(0x00000000);
  Color primaryText = const Color(0xFF696773);
  Color secondaryText = const Color(0xFF272727);

  Color grayDark = Color(0xFF616E78);
  Color dark900 = Color(0xFF090F13);
  Color background = Color(0xFF14181B);
  Color grayIcon = Color(0xFF95A1AC);
  Color tertiary = Color(0xFF39D2C0);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
