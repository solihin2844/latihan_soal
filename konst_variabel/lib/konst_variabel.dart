library konst_variabel;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//WARNA
Color warnaHitam = Colors.black;
Color warnaPutih = Colors.white;
Color warnaGrey = Colors.grey;
Color warnaBlueGrey = Colors.blueGrey;
Color warnaPutih60 = Colors.white60;
Color warnaPutih38 = Colors.white38;
Color warnaPrimary = const Color(0xff3A7FD5);
Color textWhiteGrey = const Color(0xfff1f1f5);
Color colorLight = const Color(0xfffbfbfb);
Color warnaMerah = Colors.red;
//TEXT STYLE
TextStyle text10Black = GoogleFonts.roboto(
  fontSize: 10,
  color: warnaHitam,
);

TextStyle text12Black = GoogleFonts.roboto(
  fontSize: 12,
  color: warnaHitam,
);

TextStyle text14Black = GoogleFonts.roboto(
  fontSize: 14,
  color: warnaHitam,
);

TextStyle text16Black = GoogleFonts.roboto(
  fontSize: 16,
  color: warnaHitam,
);

TextStyle text18Black = GoogleFonts.roboto(
  fontSize: 18,
  color: warnaHitam,
);
TextStyle text20Black = GoogleFonts.roboto(
  fontSize: 20,
  color: warnaHitam,
);
TextStyle text22Black = GoogleFonts.roboto(
  fontSize: 22,
  color: warnaHitam,
);

TextStyle text10Putih = GoogleFonts.roboto(
  fontSize: 10,
  color: warnaPutih,
);

TextStyle text12Putih = GoogleFonts.roboto(
  fontSize: 12,
  color: warnaPutih,
);

TextStyle text14Putih = GoogleFonts.roboto(
  fontSize: 14,
  color: warnaPutih,
);

TextStyle text16Putih = GoogleFonts.roboto(
  fontSize: 16,
  color: warnaPutih,
);

TextStyle text18Putih = GoogleFonts.roboto(
  fontSize: 18,
  color: warnaPutih,
);
TextStyle text20Putih = GoogleFonts.roboto(
  fontSize: 20,
  color: warnaPutih,
);
TextStyle text22Putih = GoogleFonts.roboto(
  fontSize: 22,
  color: warnaPutih,
);

TextStyle textGrey = const TextStyle(fontSize: 12, color: Colors.grey);

TextStyle heading2 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);
TextStyle heading3 = const TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
);
TextStyle heading4 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);
TextStyle heading5 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);
TextStyle heading6 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle heading12 = const TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

SizedBox rowSpace(double h) {
  return SizedBox(
    height: h,
  );
}

SizedBox colSpace(double w) {
  return SizedBox(
    width: w,
  );
}
