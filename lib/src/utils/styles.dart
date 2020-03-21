import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getHeaderNameTextStyle() => GoogleFonts.nunitoSans(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
);

TextStyle getPanelHeaderTextStyle() => GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w900,
  fontSize: 36.0,
  color: Color.fromRGBO(42,43,43, 1)
);

TextStyle getBookPointNameTextStyle() => GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w800,
  fontSize: 22.0
);

TextStyle getBookPointAuthorTextStyle() => GoogleFonts.nunitoSans(
    color: Color.fromRGBO(100, 100, 100, 1),
  fontSize: 17.0
);

TextStyle getBookLineAuthorTextStyle() => GoogleFonts.nunitoSans(
    color: Color.fromRGBO(100, 100, 100, 1),
    fontSize: 14.0
);

TextStyle getBookLineNameTextStyle() => GoogleFonts.nunitoSans(
    fontWeight: FontWeight.w800,
    fontSize: 18.0
);

TextStyle getBookLinePriceTextStyle() => GoogleFonts.nunitoSans(
    fontSize: 16.0
);

Color getBackgroundAppColor() => Color.fromRGBO(229, 229, 229, 1);


