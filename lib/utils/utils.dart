import 'package:flutter/material.dart';

class Utils {
  double recoverSize(context) {
    Size size = MediaQuery.of(context).size;
    if (size.width < 400) {
      return size.width - 32;
    } else {
      return 380;
    }
  }

  double paddingResponsive(context) {
    Size size = MediaQuery.of(context).size;
    if (size.width < 322) {
      return size.width * 0.24;
    } else if (size.width < 365) {
      return size.width * 0.23;
    } else if (size.width < 400) {
      return size.width * 0.28;
    } else {
      return 120.5;
    }
  }
}
