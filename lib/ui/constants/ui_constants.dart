import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF7C3E66);
Color textColor = const Color(0xFF000000).withOpacity(0.8);
const Color appYellowColor = Color(0xFFFFC107);
const Color backgroundWhiteColor = Color(0xFFECF0F3);
const Color whiteColor = Colors.white;
Color neumorphicShaddowColor = const Color(0xFFCFD3D6);
const Color mainHintColor = Color(0xFFA5BECC);
Color altHintColor = const Color(0xFFE5E5E5).withOpacity(0.2);

const String noImageHotelAltUrl =
    "https://images.unsplash.com/photo-1455587734955-081b22074882?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1920&q=80";

BoxDecoration testBorder = BoxDecoration(
  border: Border.all(color: primaryColor),
);

double extraLargeFontSize = 26;
double largeFontSize = 22;
double mediumFontSize = 18;
double smallFontSize = 14;

// Extra Large Text styles
TextStyle textDisplayExtraLargePrimary = TextStyle(
  fontSize: extraLargeFontSize,
  color: primaryColor,
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);

// Large Text styles
TextStyle textDisplayLarge = TextStyle(
  fontSize: largeFontSize,
  color: textColor,
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);

TextStyle textDisplayLargeAlt = TextStyle(
  fontSize: largeFontSize,
  color: whiteColor,
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);

// Medium Text styles
TextStyle textDisplayMedium = TextStyle(
  fontSize: mediumFontSize,
  color: textColor,
  fontWeight: FontWeight.w500,
  overflow: TextOverflow.ellipsis,
);

TextStyle textDisplayMediumPrimary = TextStyle(
  fontSize: mediumFontSize,
  color: primaryColor,
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);

TextStyle textDisplayMediumAlt = TextStyle(
  fontSize: mediumFontSize,
  color: whiteColor,
  fontWeight: FontWeight.w500,
  overflow: TextOverflow.ellipsis,
);
