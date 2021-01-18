import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppStyle {
  static Color primaryColor = Color.fromRGBO(32, 71, 152, 1.0);

  //TextStyle
  static TextStyle boldH1 = TextStyle(color: Colors.white, fontSize: 35.0);
  static TextStyle thinH2Light = TextStyle(
      color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20.0);
  static TextStyle thinH2Dark = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 20.0);

  static TextStyle helperYellow =
      TextStyle(fontSize: 12.0, color: Colors.yellow);
  //Padding
  static EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 16.0);
  static EdgeInsets screenPaddingAll =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0);

  //Sizedbox
  static SizedBox paddingSameObjectColumn = SizedBox(height: 15.0);
  static SizedBox paddingDifferentObjectColumn = SizedBox(height: 30.0);
  static SizedBox paddingSameObjectRow = SizedBox(height: 5.0);
  static SizedBox paddingDifferentObjectRow = SizedBox(height: 10.0);

  //Image
  static SvgPicture success = SvgPicture.asset(
    'assets/images/success.svg',
    height: 160.0,
  );

  static SvgPicture failed = SvgPicture.asset(
    'assets/images/failed.svg',
    height: 160.0,
  );

  static SvgPicture sad = SvgPicture.asset(
    'assets/images/sad.svg',
    height: 160.0,
  );

  static SvgPicture empty = SvgPicture.network(
    'assets/images/empty.svg',
    height: 160.0,
  );

  static Icon getIconTopup(int value) {
    switch (value) {
      case 0:
        return Icon(
          Icons.timelapse_outlined,
          size: 35.0,
          color: Colors.grey,
        );
        break;
      case 1:
        return Icon(
          Icons.check_circle_outlined,
          size: 35.0,
          color: Colors.green,
        );
        break;
      default:
        return Icon(
          Icons.remove_circle_outline_rounded,
          size: 35.0,
          color: Colors.red,
        );
    }
  }

  static String getStatusTopup(int value) {
    switch (value) {
      case 0:
        return "DALAM KONFIRMASI";
        break;
      case 1:
        return "DITERIMA";
        break;
      default:
        return "DITOLAK";
    }
  }

  static TextStyle getStatusAction(String value) {
    switch (value) {
      case "D":
        return TextStyle(fontWeight: FontWeight.bold, color: Colors.green);
        break;
      default:
        return TextStyle(fontWeight: FontWeight.bold, color: Colors.red);
    }
  }

  //Gradient
  static LinearGradient blueToDarkBlue = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff021B79), Color(0xff0575E6)]);
}
