import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapi/utils/colors.dart';

const kbookmark = 'KBOOKMARK';

class Poppins {
  static TextStyle kTextStyle20Black700Medium = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static TextStyle kTextStyle18Blue700Medium = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle kTextStyle16Blue700 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}

class LaoSangamMN {
  static TextStyle kTextStyleGrey10Regular = const TextStyle(
    color: textDarkColor,
    fontFamily: 'LaoSangamMN',
    fontSize: 10,
  );

  static TextStyle kTextStyle12regular = const TextStyle(
    // color: Colors.white,
    fontFamily: 'LaoSangamMN',
    fontSize: 12,
  );

  static TextStyle kTextStyle17regular = const TextStyle(
    // color: Colors.white,
    fontFamily: 'LaoSangamMN',
    fontSize: 17,
  );

  static TextStyle kTextStyle16regular = const TextStyle(
    fontSize: 16,
    fontFamily: 'LaoSangamMN',
  );
  static TextStyle kTextStyle20regularPrimaryColor = const TextStyle(
    fontSize: 20,
    fontFamily: 'LaoSangamMN',
    color: primarycolor,
  );
  static TextStyle kTextStyle16regularPrimaryColor = const TextStyle(
    fontSize: 16,
    fontFamily: 'LaoSangamMN',
    color: primarycolor,
  );

  static TextStyle kTextStyleHintText = const TextStyle(
    color: textDarkColor,
    fontFamily: 'LaoSangamMN',
    fontSize: 16,
  );

  static TextStyle kTextStyleHintTextPrimaryColor = const TextStyle(
    color: primarycolor,
    fontFamily: 'LaoSangamMN',
    fontSize: 16,
  );

  static TextStyle kTextStyle14Normal = const TextStyle(
    // color: Colors.white,
    fontSize: 14,
    fontFamily: 'LaoSangamMN',
  );

  static TextStyle kTextStyle15Normal = const TextStyle(
    // color: Colors.white,
    fontSize: 15,
    fontFamily: 'LaoSangamMN',
  );

  static TextStyle kTextStyle18Normal = const TextStyle(
    fontSize: 18,
    fontFamily: 'LaoSangamMN',
  );
  static TextStyle kTextStyle18Bold = const TextStyle(
    fontSize: 18,
    fontFamily: 'LaoSangamMN',
    fontWeight: FontWeight.bold,
  );
  static TextStyle kTextStyle22Bold = const TextStyle(
    fontSize: 22,
    fontFamily: 'LaoSangamMN',
  );
}
