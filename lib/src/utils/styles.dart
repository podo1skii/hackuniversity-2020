import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getHeaderNameTextStyle() => GoogleFonts.varela(
  fontSize: 18.0,
  fontWeight: FontWeight.w800,
);

TextStyle getPanelHeaderTextStyle() => GoogleFonts.varela(
  fontWeight: FontWeight.w900,
  fontSize: 36.0,
  color: Color.fromRGBO(42,43,43, 1)
);

TextStyle getBookPointNameTextStyle() => GoogleFonts.varela(
  fontWeight: FontWeight.w800,
  fontSize: 22.0
);

TextStyle getBookPointAuthorTextStyle() => GoogleFonts.varela(
    color: Color.fromRGBO(100, 100, 100, 1),
  fontSize: 17.0
);

TextStyle getBookLineAuthorTextStyle() => GoogleFonts.varela(
    color: Color.fromRGBO(100, 100, 100, 1),
    fontSize: 14.0
);

TextStyle getBookLineNameTextStyle() => GoogleFonts.varela(
    fontWeight: FontWeight.w800,
    fontSize: 18.0
);

TextStyle getBookLinePriceTextStyle() => GoogleFonts.varela(
    fontSize: 16.0
);

TextStyle getBookInfoNameTextStyle() => GoogleFonts.varela(
    fontSize: 24.0,
  fontWeight: FontWeight.w800
);

TextStyle getBookInfoAuthorTextStyle() => GoogleFonts.varela(
    fontSize: 20.0,
);

TextStyle getBookInfoRateTextStyle() => GoogleFonts.varela(
  fontSize: 16.0,
  fontWeight: FontWeight.w600
);


TextStyle getBottomTextStyle() => GoogleFonts.varela(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  color: Colors.white
);

TextStyle getGenresTextStyle() => GoogleFonts.varela(
    fontSize: 16.0,
    fontWeight: FontWeight.w200,
    color: getDarkGreyColor()
);

Color getBackgroundAppColor() => Color.fromRGBO(250, 250, 250, 1);

Color getGreyColor() => Color.fromRGBO(200, 200, 200, 1);

Color getDarkGreyColor() => Color.fromRGBO(100, 100, 100, 1);


